import 'package:dio/dio.dart';

class DioQibla {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.aladhan.com/v1/qibla',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData(String url) async {
    if (dio == null) {
      print('Dio is not initialized');
      return null;
    }

    dio!.options.queryParameters = {
      'latitude': 26.820553,
      'longitude': 30.802498
    };

    try {
      return await dio!.get(url);
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
