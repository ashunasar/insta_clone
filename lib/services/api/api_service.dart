import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../controllers/connection/internet_connection_checker_controller.dart';
import '../../utils/app_logger.dart';
import '../../utils/constants.dart';
import '../../utils/global.dart';
import '../../utils/preference.dart';
import '../../utils/utils_functions.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  late Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
  }) {
    connectivity = Connectivity();
  }

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    //* setting internet status to false (it will display no internet screen)
    getx.Get.find<InternetConnectionCheckerController>()
        .updateInternetStatus(status: false);

    //* declaring a strem subscription
    StreamSubscription? streamSubscription;

    //* initilizing responseCompleter
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        //* checking for connectivity result
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription?.cancel();

          //* setting internet status to true (it will stop displaying no internet screen)
          getx.Get.find<InternetConnectionCheckerController>()
              .updateInternetStatus(status: true);

          //* Complete the completer instead of returning
          responseCompleter.complete(
            //* sending api request with same properties ( dio request when internet was not connected)
            dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                sendTimeout: requestOptions.sendTimeout,
                receiveTimeout: requestOptions.receiveTimeout,
                extra: requestOptions.extra,
                headers: requestOptions.headers,
                responseType: requestOptions.responseType,
                contentType: requestOptions.contentType,
                validateStatus: requestOptions.validateStatus,
                receiveDataWhenStatusError:
                    requestOptions.receiveDataWhenStatusError,
                followRedirects: requestOptions.followRedirects,
                maxRedirects: requestOptions.maxRedirects,
                requestEncoder: requestOptions.requestEncoder,
                responseDecoder: requestOptions.responseDecoder,
                listFormat: requestOptions.listFormat,
              ),
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}

class ApiService {
  late Dio _dio;

  //* setting base options for api request
  ApiService(String baseUrl) {
    final options = BaseOptions(
      baseUrl: '${Global.host}$baseUrl',
      connectTimeout: const Duration(milliseconds: 90000),
      receiveTimeout: const Duration(milliseconds: 90000),
      sendTimeout: const Duration(milliseconds: 90000),
    );
    //* initializing dio with options
    _dio = Dio(options);

    //* adding dio interceptor
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      //* setting Authorization header if token found
      try {
        final token = Preference.getString(Constants.accessToken);
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
      } catch (e) {
        AppLogger.printLog(e);
      }

      return handler.next(options);
    }, onResponse: (response, handler) {
      //* logging response values in console
      AppLogger.printLog(""
          "Base url is : ${response.requestOptions.baseUrl} path is ${response.requestOptions.path}\n"
          "Status code is: ${response.statusCode}\n"
          "Status message is: ${response.statusMessage}\n"
          "Request Method is: ${response.requestOptions.method}\n"
          "Query Parameters is : ${response.requestOptions.queryParameters}\n"
          "Data sent is : ${response.requestOptions.data}\n"
          "Headers is : ${response.requestOptions.headers}\n"
          "Data is : ${response.data}\n");

      return handler.next(response);
    }, onError: (DioError dioError, handler) async {
      //* logging error in console
      AppLogger.printLog(dioError);

      late String message;

      message = "";
      if (dioError.type == DioErrorType.badResponse) {
        final data = dioError.response!.data;
        AppLogger.printLog(data);

        //! conditions to handel error according to it's type

        if (dioError.response!.statusCode == 400) {
          message = "Some error occured";
        } else if (dioError.response!.statusCode == 401) {
          // if (!message.toLowerCase().contains("otp")) {
          final refreshToken = Preference.getString(Constants.refreshToken);
          if (data['error']['message'] == "jwt expired" &&
              refreshToken != null) {
            var res = await _dio.post(
              Constants.refreshTokenEndPoint,
              data: jsonEncode({
                "refreshToken": refreshToken,
              }),
            );

            if (res.statusCode == 201) {
              String accessToken = res.data['accessToken'];
              String refreshToken = res.data['refreshToken'];
              Preference.setString(Constants.accessToken, accessToken);
              Preference.setString(Constants.refreshToken, refreshToken);
              options.headers["Authorization"] = "Bearer $accessToken";
              try {
                //! retry for dio request if SocketException found
                return handler.resolve(
                    await DioConnectivityRequestRetrier(dio: _dio)
                        .scheduleRequestRetry(dioError.requestOptions));
              } catch (e) {
                AppLogger.printLog(e);
              }
            } else if (res.statusCode == 401) {
              Preference.clear();
              // getx.Get.offAll(() => SignInScreen());
              // } else {
              message = data['error']['message'].toString();
            }
          } else {
            // getx.Get.offAll(() => AuthHomeScreen());
            getx.Get.offAllNamed('/auth_home_screen');
            // } else {
            message = data['error']['message'].toString();
          }

          // }
        } else if (dioError.response!.statusCode == 403) {
          // getx.Get.offAll(() => SignInScreen());
          message = data['error']['message'].toString();
        } else if (dioError.response!.statusCode == 404) {
          message = "Not found";
        } else if (dioError.response!.statusCode == 405) {
          message = "Route does not exist";
        } else if (dioError.response!.statusCode == 500) {
          // message = data['error'].toString();
          // message = dioError.response!.statusMessage!;
          message = data['error']['message'].toString();
        } else {
          message = "Something went wrong";
        }
      } else if (dioError.type == DioErrorType.connectionTimeout) {
        message = "connection timedout";
      } else if (dioError.error is SocketException) {
        message = "Please check your internet connection";
        UtilFunctions.showToast(
          message: message,
        );

        try {
          //! retry for dio request if SocketException found
          return handler.resolve(await DioConnectivityRequestRetrier(dio: _dio)
              .scheduleRequestRetry(dioError.requestOptions));
        } catch (e) {
          AppLogger.printLog(e);
        }
      }

      UtilFunctions.showToast(
        message: message,
      );

      return handler.next(dioError);
    }));
  }

  Dio? getClient() {
    return _dio;
  }
}
