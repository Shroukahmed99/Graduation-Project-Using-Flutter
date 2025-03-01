import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/auth/data/models/signup_model.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class SignupRepoImpl extends SignupRepo {
  final ApiService apiService;

  SignupRepoImpl(this.apiService);
  @override
  Future<Either<Failure, SignupModel>> SignupUsres(
      {required fullName,
      required email,
      required mobileNumber,
      required password,
      required passwordConfirm,
      required gender,
      required age,
      required weight,
      required height,
      required goal,
      required physicalActivityLevel}) async {
    try {
      var data = await apiService.post(endPoint: 'clientSignUp', data: {
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'gender': gender,
        'age': age,
        'weight': weight,
        'height': height,
        'goal': goal,
        'physicalActivityLevel': physicalActivityLevel,
      });
      return right(SignupModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
