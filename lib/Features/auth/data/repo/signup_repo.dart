import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/models/signup_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class SignupRepo {
  Future<Either<Failure, SignupModel>> SignupUsres({
    required fullName,
    required email,
    required mobileNumber,
    required password,
    required passwordConfirm,
    required gender,
    required age,
    required weight,
    required height,
    required goal,
    required physicalActivityLevel,
  });
}
