import 'package:dio/dio.dart';
import '../../../services/api/api_service.dart';

class HomeService {
  //* initilizing dio with api service client

  Dio? dio = ApiService('/api').getClient();

  Future userData() async {
    return await dio!.get(
      '/api/users?page=2',
    );
  }
}
