import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20client/sign_up_client_state.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_state.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

// Import the necessary package
import 'dart:io';

class SignUpProviderCubit extends Cubit<SignUpProviderState> {
  final UsersRepo usersRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpProviderCubit(this.usersRepo) : super(SignUpProviderInitial());

  // Modify the method to accept a nullable File? parameter
  Future<void> signUpUser() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      print("❌ الفورم غير صالح أو غير موجود");
      return;
    }

    emit(SignUpProviderLoading());
    String fullName = CacheHelper.getData(key: 'fullName') ?? '';
    String email = CacheHelper.getData(key: 'email') ?? '';
    String mobileNumber = CacheHelper.getData(key: 'mobileNumber') ?? '';
    String password = (CacheHelper.getData(key: 'password') ?? '').toString();
    String passwordConfirm =
        (CacheHelper.getData(key: 'passwordConfirm') ?? '').toString();
    String gender = CacheHelper.getData(key: 'gender') ?? '';
    String age = (CacheHelper.getData(key: 'age') ?? '').toString();
    String job = CacheHelper.getData(key: 'job') ?? '';
    String yearsOfExperience =
        (CacheHelper.getData(key: 'yearsOfExperience') ?? '').toString();
    String jobTiltle = CacheHelper.getData(key: 'jobTiltle') ?? '';
    String bio = CacheHelper.getData(key: 'bio') ?? '';
    String priceRange = (CacheHelper.getData(key: 'priceRange') ?? '450').toString();

    // استرجاع ملف الـ identifier (بشكل اختياري)
    String? filePath = CacheHelper.getData(key: 'identifier');
File? identifier = filePath != null && filePath.isNotEmpty ? File(filePath) : null;


    print('📌 Data to be sent to server:');
    print('Full Name: $fullName');
    print('Email: $email');
    print('Mobile: $mobileNumber');
    print('Password: $password');
    print('Confirm Password: $passwordConfirm');
    print('Gender: $gender');
    print('Age: $age');
    print('Job: $job');
    print('Years of Experience: $yearsOfExperience');
    print('Job Title: $jobTiltle');
    print('Bio: $bio');
    print('Price Range: $priceRange');
    print('Identifier: $identifier');

    // تمرير الـ identifier الاختياري إلى الـ repo
    Either<Failure, UsersModel> result = await usersRepo.signUpProvider(
      fullName: fullName,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
      passwordConfirm: passwordConfirm,
      gender: gender,
      age: age,
      job: job,
      yearsOfExperience: yearsOfExperience,
      jobTiltle: jobTiltle,
      bio: bio,
      priceRange: priceRange,
      identifier: identifier ?? File(''),

    );

    result.fold(
  (failure) {
    print('❌ Error: ${failure.errorMessage}');
    emit(SignUpProviderFailure(failure.errorMessage));
  },
  (usersModel) async {
    if (usersModel.token != null) {
      print('✅ SignUp Success');
      await CacheHelper.saveData(key: 'token', value: usersModel.token);
      print("✅ Token saved successfully!");
      print("Token sent to server: ${usersModel.token}");
      emit(SignUpProviderSuccess(usersModel));
    } else {
      print("❌ API Response missing token!");
      emit(SignUpProviderFailure("API Response missing token!"));
    }
  },
);

  }
}
