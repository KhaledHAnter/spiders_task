import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  // late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to server was cancelled');
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with server');
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  'Connection to server failed due to internet connection');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: 'Receive timeout in connection with server');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: 'Send timeout in connection with server');
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        default:
          return ApiErrorModel(message: 'Something went wrong');
      }
    } else {
      return ApiErrorModel(message: 'Unknown error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? 'Something went wrong',
    code: data['code'],
    errors: data['data'],
  );
}
