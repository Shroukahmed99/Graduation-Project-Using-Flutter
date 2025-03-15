import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/data/model/forget_password_model.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/model/otp_model.dart';
import 'package:sehatak/Features/auth/data/model/set_password.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
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

      // إرسال الطلب عبر apiService
      var data = await apiService.post(
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
          "physicalActivityLevel": physicalActivityLevel,
        },
      );

      print("📤 API Response: $data");

      if (data["status"] == "success") {
        // استخراج بيانات المستخدم وتخزين التوكن
        String token = CacheHelper.getData(key: "token") ?? "";

        UsersModel signUpModel = UsersModel.fromJson(data["data"]);
        return Right(signUpModel); // إرجاع النتيجة بنجاح
      } else {
        return Left(ServerFailure(
            data["message"])); // في حال وجود خطأ في الاستجابة من السيرفر
      }
    } catch (e) {
      print("❌ API Error: $e");
      if (e is DioException) {
        return Left(
            ServerFailure.fromDioError(e)); // في حال كان الخطأ من نوع Dio
      }
      return Left(ServerFailure(e.toString())); // في حال وجود أي خطأ آخر
    }
  }

  Future<Either<Failure, UsersModel>> loginUser(
      {required email, required password}) async {
    try {
      var data = await apiService.post(
        endpoint: "login",
        data: {
          "email": email,
          "password": password,
        },
      );
      return right(UsersModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetUser({
    required String email,
  }) async {
    try {
      var responseData = await apiService.post(
        endpoint: "forgetPassword",
        data: {
          "email": email,
        },
      );

      if (responseData["status"] == "success") {
        ForgetPasswordModel forgetPasswordModel =
            ForgetPasswordModel.fromJson(responseData);
        return Right(forgetPasswordModel); // إرجاع النتيجة بنجاح
      } else {
        return Left(
            ServerFailure(responseData["message"])); // إرجاع الخطأ من الخادم
      }
    } catch (e) {
      // التعامل مع الأخطاء الخاصة بـ Dio
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString())); // في حال وجود أي أخطاء أخرى
    }
  }

  Future<Either<Failure, OtpModel>> otpUser({
    required String resetCode,
  }) async {
    try {
      var responseData = await apiService.post(
        endpoint: "verifyOTP",
        data: {
          "resetCode": resetCode,
        },
      );

      if (responseData["status"] == "success") {
        OtpModel otpModel = OtpModel.fromJson(responseData);

        // ✅ حفظ userId في الكاش
        CacheHelper.saveData(key: 'userId', value: otpModel.userId);

        return Right(otpModel); // إرجاع النتيجة بنجاح
      } else {
        return Left(
            ServerFailure(responseData["message"])); // إرجاع الخطأ من الخادم
      }
    } catch (e) {
      // التعامل مع الأخطاء الخاصة بـ Dio
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString())); // في حال وجود أي أخطاء أخرى
    }
  }

  Future<Either<Failure, SetPassword>> setPassword({
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      String? userId = CacheHelper.getData(key: 'userId');
      if (userId == null || userId.isEmpty) {
        return Left(ServerFailure("User ID is invalid"));
      }

      var responseData = await apiService.patch(
        endpoint: "resetPassword/$userId",
        data: {
          "password": password,
          "passwordConfirm": passwordConfirm,
        },
      );

      if (responseData["status"] == "success") {
        return Right(SetPassword.fromJson(responseData)); // إرجاع النتيجة بنجاح
      } else {
        return Left(
            ServerFailure(responseData["message"])); // إرجاع الخطأ من الخادم
      }
    } catch (e) {
      // التعامل مع الأخطاء
      return Left(ServerFailure(e.toString())); // إرجاع الأخطاء
    }
  }

  Future<Either<Failure, UsersModel>> signUpProvider({
    required String fullName,
    required String email,
    required String mobileNumber,
    required String password,
    required String passwordConfirm,
    required String gender,
    required String age,
    required String job,
    required String yearsOfExperience,
    required String jobTiltle,
    required String bio,
    required String priceRange,
    required File identifier,
  }) async {
    try {
      // تجهيز الصورة كـ MultipartFile إذا كانت موجودة
      MultipartFile? multipartFile;
      if (identifier.existsSync()) {
        String mimeType = getMimeType(identifier.path);
        multipartFile = await MultipartFile.fromFile(
          identifier.path,
          filename: identifier.path.split('/').last,
          contentType:
              MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
        );
      }

      FormData formData = FormData.fromMap({
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'gender': gender,
        'age': age,
        'job': job,
        'yearsOfExperience': yearsOfExperience,
        'jobTiltle': jobTiltle,
        'bio': bio,
        'priceRange': priceRange,
        if (multipartFile != null) 'identifier': multipartFile,
      });

      var responseData = await apiService.post(
        endpoint: 'serviceProviderSignUp',
        data: formData,
      );

      if (responseData == null || !responseData.containsKey('data')) {
        return Left(ServerFailure("❌ API Response is null or missing data"));
      }

      if (!responseData['data'].containsKey('user')) {
        return Left(
            ServerFailure("❌ API Response does not contain 'user' key"));
      }

      return Right(UsersModel.fromJson(responseData)); // إرجاع النتيجة بنجاح
    } catch (e) {
      return Left(ServerFailure(e.toString())); // إرجاع الأخطاء
    }
  }

// ✅ دالة استخراج نوع الصورة تلقائيًا
  String getMimeType(String filePath) {
    String extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';
      default:
        return 'application/octet-stream';
    }
  }
}
