import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/repo/sign_up_repo.dart';
import 'package:sehatak/Features/auth/model/login_model.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiService apiService;

  SignUpRepoImpl(this.apiService);

  @override
   Future<Either<Failure, LoginModel>> SignUpUser({required String fullName, required String password, required String email, required String mobileNumber, required String passwordConfirm, required String gender, required String age, required String weight, required String goal, required String physicalActivityLevel, required String height})async {

    try {
      Response response = await apiService.post(
        endpoint: "clientSignUp",
        data: {
         "fullName":fullName,
"email":email,
"mobileNumber":mobileNumber,
"password":password,
"passwordConfirm": passwordConfirm,
"gender":gender,
"age":age,
"weight":weight,
"height": height,
"goal":goal,
"physicalActivityLevel":physicalActivityLevel
        },
      );

      if (response.data["status"] == "success") {
        String token = CacheHelper.getData(key: "token") ?? "";

        LoginModel signUpModel = LoginModel.fromJson(response.data["data"], token);
        return Right(signUpModel);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  

}
