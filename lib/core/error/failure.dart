import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      try {
        final data = dioError.response!.data;

        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return ServerFailure(data['message'].toString());
        } else {
          return ServerFailure(data.toString());
        }
      } catch (e) {
        return ServerFailure('An unexpected error occurred.');
      }
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
}
