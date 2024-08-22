import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.aladhan.com/v1/calendar',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(String url) {
    dio!.options.queryParameters = {
      'latitude': 26.820553,
      'longitude': 30.802498
    };
    return dio!.get(url);
  }
}
