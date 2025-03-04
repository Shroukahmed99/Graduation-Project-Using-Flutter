import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/core/error/failure.dart';

@override
abstract class UsersRepo {
  Future<Either<Failure, UsersModel>> signUpUser({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String passwordConfirm,
    required String gender,
    required String age,
    required String weight,
    required String goal,
    required String physicalActivityLevel,
    required String height,
  });
  Future<Either<Failure, UsersModel>> loginUser({
    required String email,
    required String password,
  });
}
