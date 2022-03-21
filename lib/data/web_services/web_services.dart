import 'package:dio/dio.dart';
import 'package:news_app/shared/components/constants.dart';

class WebServices {
  static Dio? dio;

  static init() {
      dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: 20000,
            receiveTimeout: 20000,
          ));

  }


  Future<List<dynamic>> getData({required Map<String, dynamic> query , required String url}) async {
    try {
      Response response = await dio!.get(url, queryParameters: query);
      return response.data["articles"];
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }

}