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

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetUser({
    required String email,
  }) async {
    try {
      Response response = await apiService.post(
        endpoint: "forgetPassword",
        data: {
          "email": email,
        },
      );

      if (response.data["status"] == "success") {
        ForgetPasswordModel forgetPasswordModel =
            ForgetPasswordModel.fromJson(response.data);
        return Right(forgetPasswordModel);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// ✅ تنفيذ التحقق من كود OTP
  @override
  Future<Either<Failure, OtpModel>> otpUser({required String resetCode}) async {
    try {
      Response response = await apiService.post(
        endpoint: "verifyOTP",
        data: {
          "resetCode": resetCode,
        },
      );

      if (response.data["status"] == "success") {
        OtpModel otpModel = OtpModel.fromJson(response.data);

        // ✅ حفظ userId
        CacheHelper.saveData(key: 'userId', value: otpModel.userId);

        // ✅ طباعة القيم المخزنة للتأكد
        String? checkUserId = CacheHelper.getData(key: 'userId');
        print("✅ Verified userId after saving: $checkUserId");

        return Right(otpModel);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, SetPassword>> setPassword({
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      String? userId = CacheHelper.getData(key: 'userId');
      print("🔍 Retrieved userId before sending request: $userId");

      if (userId == null || userId.isEmpty) {
        print("❌ Error: User ID is missing or invalid!");
        return Left(ServerFailure("User ID is invalid"));
      }

      Response response = await apiService.patch(
        endpoint: "resetPassword/$userId",
        data: {
          "password": password,
          "passwordConfirm": passwordConfirm,
        },
      );

      if (response.data["status"] == "success") {
        print("✅ Password reset successful!");
        return Right(SetPassword.fromJson(response.data));
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override


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
  required String jobTiltle, // ✅ تأكد إن الاسم متطابق مع الـ API
  required String bio,
  required String priceRange,
  required File identifier,
}) async {
  try {
    // ✅ تجهيز الصورة كـ MultipartFile مع التأكد من وجود الملف
    MultipartFile? multipartFile;
    if (identifier != null && await identifier.exists()) {
      String mimeType = getMimeType(identifier.path);
      multipartFile = await MultipartFile.fromFile(
        identifier.path,
        filename: identifier.path.split('/').last,
        contentType: MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
      );
    }

    // ✅ تجهيز FormData
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
      'jobTiltle': jobTiltle, // ✅ تأكد من التسمية
      'bio': bio,
      'priceRange': priceRange,
      if (multipartFile != null) 'identifier': multipartFile, // ✅ تأكد أن الملف موجود
    });

    // ✅ طباعة البيانات قبل الإرسال
    print('====================');
    print('📤 Sending FormData:');
    formData.fields.forEach((field) {
      print('📝 ${field.key}: ${field.value}');
    });
    formData.files.forEach((file) {
      print('📸 ${file.key}: ${file.value.filename}');
    });
    print('====================');

    // ✅ إرسال البيانات
    Response response = await apiService.post(
  endpoint: 'serviceProviderSignUp',
  data: formData,
);

print('✅ Response: ${response.data}'); // ✅ طباعة الاستجابة

final responseData = response.data;

// **تحقق من أن الاستجابة تحتوي على البيانات المطلوبة**
if (responseData == null) {
  return Left(ServerFailure("❌ API Response is null"));
}
if (!responseData.containsKey('data')) {
  return Left(ServerFailure("❌ API Response does not contain 'data' key"));
}
if (!responseData['data'].containsKey('user')) {
  return Left(ServerFailure("❌ API Response does not contain 'user' key"));
}

// ✅ مرر الـ `responseData` بالكامل وليس فقط `user`
return Right(UsersModel.fromJson(responseData));

  } catch (e) {
    print('❌ Error: $e'); // ✅ طباعة الخطأ
    return Left(ServerFailure(e.toString()));
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
