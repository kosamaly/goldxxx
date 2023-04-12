import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://www.goldapi.io/api',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(String path) {
    // url =  '/XAG/USD/'
    dio!.options.headers = {'x-access-token': 'goldapi-7e18orlgagahww-io'};

    return dio!.get(path);
  }
}
