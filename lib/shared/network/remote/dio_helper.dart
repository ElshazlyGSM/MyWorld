import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {'Content-Type': 'application/json',}
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> date,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: date,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> date,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return dio.put(
      url,
      queryParameters: query,
      data: date,
    );
  }
}

//https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&apiKey=3434a0899e7441189c532dfedf64c08a
