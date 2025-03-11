import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20client/sign_up_client_state.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UsersRepo usersRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpCubit(this.usersRepo) : super(SignupInitial());

  Future<void> signUpUser() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      print("❌ الفورم غير صالح أو غير موجود");
      return;
    }

    emit(SignupLoading());

    // استرجاع كل قيمة بشكل منفصل من `CacheHelper`
    String fullName = CacheHelper.getData(key: 'fullName') ?? '';
    String email = CacheHelper.getData(key: 'email') ?? '';
    String mobileNumber = CacheHelper.getData(key: 'mobileNumber') ?? '';
    String password =( CacheHelper.getData(key: 'password') ?? '').toString();
    String passwordConfirm = (CacheHelper.getData(key: 'passwordConfirm') ?? '').toString();
    String gender = CacheHelper.getData(key: 'gender') ?? '';
    String goal = CacheHelper.getData(key: 'goal') ?? '';
    String physicalActivityLevel =
        CacheHelper.getData(key: 'physicalActivityLevel') ?? 'Intermediate';

    // تحويل القيم الرقمية إلى `String`
    String age = (CacheHelper.getData(key: 'age') ?? '26').toString();
    String weight = (CacheHelper.getData(key: 'weight') ?? '40').toString();
    String height = (CacheHelper.getData(key: 'height')??'142' ).toString();

    print('📌 Data to be sent to server:');
  print('Full Name: $fullName');
  print('Email: $email');
  print('Mobile: $mobileNumber');
  print('Password: $password');
  print('Confirm Password: $passwordConfirm');
  print('Gender: $gender');
  print('Age: $age');
  print('Weight: $weight');
  print('Height: $height');
  print('Goal: $goal');
  print('Physical Activity Level: $physicalActivityLevel');


    Either<Failure, UsersModel> result = await usersRepo.signUpUser(
      fullName: fullName,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
      passwordConfirm: passwordConfirm,
      gender: gender,
      age: age,
      weight: weight,
      height: height,
      goal: goal,
      physicalActivityLevel: physicalActivityLevel,
    );

    result.fold(
  (failure) {
    if (failure.errorMessage.contains("duplicate key error")) {
      print("❌ هذا الرقم مسجل مسبقًا");
    } else {
      print('❌ Error: ${failure.errorMessage}');
    }
    emit(SignupFailure(failure.errorMessage));
  },
  (usersModel) async {
    print('✅ SignUp Success');
    await CacheHelper.saveData(key: 'token', value: usersModel.token);
    print("✅ Token saved successfully!");
    print("Token sent to server: ${usersModel.token}");
    emit(SignupSuccess(usersModel));
  },
);


  }
}
