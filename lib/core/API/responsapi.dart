import 'package:dio/dio.dart';
import 'package:newproject/constent/apiLink.dart';
import 'package:newproject/core/error/hndleErorr.dart';

class Responsapi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: apiurl.basurl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  // method get data from api
  Future<dynamic> getData(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    // body methode
    // non error ****************
    try {
      var respons = await _dio.get(path, queryParameters: queryParameters);

      if (respons.statusCode == 200) {
        return respons.data;
      } else {
        return ApiFailure(
          message: 'خطأ في الاستجابة من السيرفر',
          statusCode: respons.statusCode,
        );
      }
    } on DioException catch (e) {
      return ApiFailure.fromDioException(e);
    } catch (e) {
      return ApiFailure(message: 'حدث خطأ غير متوقع: $e');
    }
  }
}
