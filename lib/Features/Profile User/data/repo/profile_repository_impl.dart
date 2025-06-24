import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/logout_respose_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/password_change_response_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/review_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/update_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/update_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

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

      if (responseData == 1 || responseData == "" || responseData == null) {
        return const Right(true);
      }

      if (responseData is Map<String, dynamic> &&
          responseData["status"] == "error") {
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
        return Left(ServerFailure(
            responseData["message"] ?? "Failed to change password"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error changing password: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, GetProfileClientModel>> getClientById() async {
    try {
      final responseData = await apiService.get(
        endpoint: 'users/getClientById',
      );

      if (responseData["status"] == "success") {
        return Right(GetProfileClientModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(
            responseData["message"] ?? "Failed to get client data"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error getting client data: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileClientModel>> updateClientProfile(
      Map<String, dynamic> data) async {
    try {
      final responseData = await apiService.patch(
        endpoint: 'users/updateClientProfile',
        data: data,
      );

      if (responseData["status"] == "success") {
        return Right(UpdateProfileClientModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(responseData["message"] ?? "Update failed"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return Left(ServerFailure("Error updating profile: ${e.toString()}"));
    }
  }



  


  @override
  Future<Either<Failure, UpdateProfileProviderModel>> updateProviderProfile(
      Map<String, dynamic> data) async {
    try {
      final responseData = await apiService.patch(
        endpoint: 'users/updateServiceProviderProfile',
        data: data,
      );
      if (responseData["status"] == "success") {
        return Right(UpdateProfileProviderModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(responseData["message"] ?? "Update failed"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("Error updating profile: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, GetProfileProviderModel>> getProviderById() async {
    try {

      final responseData = await apiService.get(
        endpoint: 'users/getServiceProviderById',
      );

      if (responseData["status"] == "success") {
        return Right(GetProfileProviderModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(
            responseData["message"] ?? "Failed to get provider data"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(
          ServerFailure("Error getting provider data: ${e.toString()}"));
    }
  }






   @override
  Future<Either<Failure, List<ReviewModel>>> getReviews() async {
    try {
      final response = await apiService.get(endpoint: 'reviews/getallReviews');
      if (response['status'] == 'success') {
        List<dynamic> data = response['data']['reviews'];
        List<ReviewModel> reviews =
            data.map((e) => ReviewModel.fromJson(e)).toList();
        return Right(reviews);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Error'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  
}

