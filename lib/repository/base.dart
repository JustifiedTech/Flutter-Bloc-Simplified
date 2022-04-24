import 'package:dio/dio.dart';

class BaseAPI {
  Dio dio = Dio(BaseOptions(
      sendTimeout: 30000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      validateStatus: (s) => s! < 500));

  // base_url test_base_url
  String baseUrl = '';
  String token = '';

  Options defaultOptions = Options(
      sendTimeout: 20000, // 20 seconds
      receiveTimeout: 20000, // 20 seconds
      contentType: 'application/json',
      validateStatus: (s) => s! < 500);
}
