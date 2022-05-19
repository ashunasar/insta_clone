import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_service.dart';

class UserApi {
  //* initilizing dio with api service cliend
  Dio? dio = ApiService().getClient();

  //* calling getTasks function
  Future getTasks({required int skip}) async {
    //* return response data
    return await dio!.get('/todos/?skip=$skip');
  }

  //* calling addTask function
  Future addTask(String title, String description) async {
    //* return response data
    return await dio!.post(
      '/todos',
      data: jsonEncode({
        "title": title,
        "description": description,
      }),
    );
  }

  //* calling addTask function
  Future deleteTask({required String id}) async {
    //* return response data
    return await dio!.delete(
      '/todos/$id',
      // data: jsonEncode({
      //   "id": id,
      // }),
    );
  }

  //* calling editTask function
  Future editTask({
    required String id,
    required String title,
    required String description,
  }) async {
    //* return response data
    return await dio!.put(
      '/todos',
      data: jsonEncode({
        "id": id,
        "title": title,
        "description": description,
      }),
    );
  }

  Future register({required String email, required String password}) async {
    return await dio!.post(
      '/auth/register',
      data: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future login({required String email, required String password}) async {
    return await dio!.post(
      '/auth/login',
      data: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
  }

  Future verifyAccessToken() async {
    return await dio!.get(
      '/auth/verify',
    );
  }

  Future userData() async {
    return await dio!.get(
      '/user-data',
    );
  }
}
