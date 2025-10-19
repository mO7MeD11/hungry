import 'package:dio/dio.dart';
import 'package:project/core/network/api_error.dart';

class ApiException {
  static ApiError handelError(DioException error) {
    
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'connectionTimeout');
      case DioExceptionType.sendTimeout:
       return ApiError(message: 'sendTimeout');
      case DioExceptionType.receiveTimeout:
       return ApiError(message: 'receiveTimeout');
      case DioExceptionType.badCertificate:
       return ApiError(message: 'badCertificate');
      case DioExceptionType.badResponse:
       return ApiError(message: error.toString());
      case DioExceptionType.cancel:
       return ApiError(message: 'cancel');
      case DioExceptionType.connectionError:
       return ApiError(message: 'connectionError');
      case DioExceptionType.unknown:
       return ApiError(message: 'there was an error');
       
    }
  }
}
