import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/repo/sign_up_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';

class UsersRepoImpl implements UsersRepo {
  final ApiService apiService;

  UsersRepoImpl(this.apiService);

  @override
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
  }) async {
    try {
      print("🚀 Sending Data: {"
          "fullName: $fullName, email: $email, mobileNumber: $mobileNumber, "
          "password: $password, passwordConfirm: $passwordConfirm, gender: $gender, "
          "age: $age, weight: $weight, height: $height, "
          "goal: $goal, physicalActivityLevel: $physicalActivityLevel}");

      Response response = await apiService.post(
        endpoint: "clientSignUp",
        data: {
          "fullName": fullName,
          "email": email,
          "mobileNumber": mobileNumber,
          "password": password,
          "passwordConfirm": passwordConfirm,
          "gender": gender,
          "age": age,
          "weight": weight,
          "height": height,
          "goal": goal,
          "physicalActivityLevel": physicalActivityLevel
        },
      );

      print("📤 API Response: ${response.data}");

      if (response.data["status"] == "success") {
        String token = CacheHelper.getData(key: "token") ?? "";

        UsersModel signUpModel = UsersModel.fromJson(
          response.data["data"],
        );
        return Right(signUpModel);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      print("❌ API Error: $e");
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, UsersModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await apiService.post(
        endpoint: "login",
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.data["status"] == "success") {
        String token = CacheHelper.getData(key: "token") ?? "";

        UsersModel loginModel = UsersModel.fromJson(response.data["data"]);
        return Right(loginModel);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
