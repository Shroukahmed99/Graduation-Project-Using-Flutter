// profile_repository.dart
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/logout_respose_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/password_change_response_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/review_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/update_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/update_profile_provider_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, LogoutResponseModel>> logout();
  Future<Either<Failure, bool>> deleteAccount();
  Future<Either<Failure, PasswordChangeResponseModel>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirm,
  });
  Future<Either<Failure, GetProfileClientModel>> getClientById();
 Future<Either<Failure, UpdateProfileClientModel>> updateClientProfile(Map<String, dynamic> data);
   Future<Either<Failure, GetProfileProviderModel>> getProviderById();
    Future<Either<Failure, UpdateProfileProviderModel>> updateProviderProfile(Map<String, dynamic> data);
    
    
 Future<Either<Failure, List<ReviewModel>>> getReviews();

   }
