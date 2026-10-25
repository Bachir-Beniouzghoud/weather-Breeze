// import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

//Hande Erorr dioExeption
class ApiFailure {
  final String? message;
  final int? statusCode;
  ApiFailure({required this.message, this.statusCode});
  factory ApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiFailure(
          message: 'انتهت مهلة الاتصال بالسيرفر',
          // statusCode: dioException.response!.statusCode,
        );
      case DioExceptionType.cancel:
        return ApiFailure(message: 'تم إلغاء الطلب');
      case DioExceptionType.connectionError:
        return ApiFailure(message: 'لا يوجد اتصال بالإنترنت');
      case DioExceptionType.badCertificate:
        return ApiFailure(message: 'شهادة الأمان غير صالحة');
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        switch (statusCode) {
          case 400:
            return ApiFailure(message: 'طلب غير صالح', statusCode: statusCode);
          case 401:
            return ApiFailure(
              message: 'غير مصرح بالدخول',
              statusCode: statusCode,
            );
          case 404:
            return ApiFailure(
              message: 'العنصر غير موجود',
              statusCode: statusCode,
            );
          case 500:
            return ApiFailure(
              message: 'خطأ داخلي في السيرفر',
              statusCode: statusCode,
            );
          default:
            return ApiFailure(
              message: 'حدث خطأ في السيرفر',
              statusCode: statusCode,
            );
        }
      default:
        return ApiFailure(message: 'حدث خطأ غير متوقع، حاول لاحقاً');
    }
  }
}
