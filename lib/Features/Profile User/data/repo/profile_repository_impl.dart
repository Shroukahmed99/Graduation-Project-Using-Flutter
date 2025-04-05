// profile_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_response_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/logout_respose_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/password_change_response_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiService apiService;

  ProfileRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, LogoutResponseModel>> logout() async {
    try {
      final responseData = await apiService.get(
        endpoint: 'users/Logout',
      );
      if (responseData["status"] == "success") {
        return Right(LogoutResponseModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(responseData["message"]));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount() async {
    try {
      final responseData = await apiService.delete(endpoint: 'users/deleteMe');

      print("🚀 Response from API: $responseData");

      if (responseData == 1 || responseData == "" || responseData == null) {
        print("true");
        return const Right(true);
      }
      
      if (responseData is Map<String, dynamic> && responseData["status"] == "error") {
        return Left(ServerFailure(responseData["message"] ?? "Unknown error"));
      }
      
      return Left(ServerFailure("Unexpected response: $responseData"));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error deleting account: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, PasswordChangeResponseModel>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirm,
  }) async {
    try {
      final data = {
        'currentPassword': currentPassword,
        'password': newPassword,
        'passwordConfirm': passwordConfirm,
      };
      
      final responseData = await apiService.patch(
        endpoint: 'users/updateMyPassword',
        data: data,
      );
      
      if (responseData["status"] == "success") {
        return Right(PasswordChangeResponseModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(responseData["message"] ?? "Failed to change password"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error changing password: ${e.toString()}"));
    }
  }

  Future<Either<Failure, ClientResponseModel>> getClientById() async {
    try {
      final responseData = await apiService.get(
        endpoint: 'users/getClientById',
      );
      
      if (responseData["status"] == "success") {
        return Right(ClientResponseModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(responseData["message"] ?? "Failed to get client data"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error getting client data: ${e.toString()}"));
    }
  }
}