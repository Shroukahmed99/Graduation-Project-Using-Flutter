import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/model/forget_password_model.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/model/otp_model.dart';
import 'package:sehatak/Features/auth/data/model/set_password.dart';
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
  Future<Either<Failure, ForgetPasswordModel>> forgetUser({
    required String email,
  });
  Future<Either<Failure, OtpModel>> otpUser({
    required String resetCode,
  });
  Future<Either<Failure, SetPassword>> setPassword({
    // ✅ تعديل الاسم لـ setPassword
    required String password,
    required String passwordConfirm,
    //required String userId,
  });
  Future<Either<Failure, UsersModel>> signUpProvider({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String passwordConfirm,
    required String gender,
    required String age,
    required String job,
    required String yearsOfExperience,
    required String jobTitle,
    required String bio,
    required String priceRange,
    required File identifier,
  });
}
