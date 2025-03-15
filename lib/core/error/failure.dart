import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    // التقاط الأخطاء من Dio أو من الـ API
    if (dioError.response != null) {
      String message = dioError.response?.data?['message'] ??
          'An unexpected error occurred.';
      return ServerFailure(message);
    }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Connection to the server timed out. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Failed to send data. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Failed to receive data. Please try again.');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad response from the server.');
      case DioExceptionType.cancel:
        return ServerFailure('The request was canceled. Please try again.');
      case DioExceptionType.unknown:
        return ServerFailure(
            'No internet connection. Please check your network.');
      default:
        return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(
          'There was an issue with the data you entered. Please check and try again.');
    } else if (statusCode == 404) {
      return ServerFailure('The requested page or resource was not found.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }
}
