// profile_repository.dart
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_response_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/logout_respose_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/password_change_response_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, LogoutResponseModel>> logout();
  Future<Either<Failure, bool>> deleteAccount();
  Future<Either<Failure, PasswordChangeResponseModel>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirm,
  });
  Future<Either<Failure, ClientResponseModel>> getClientById();
}