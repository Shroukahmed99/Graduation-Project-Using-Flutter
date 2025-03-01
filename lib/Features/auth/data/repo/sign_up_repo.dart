import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/model/login_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, LoginModel>> SignUpUser({
    
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
}