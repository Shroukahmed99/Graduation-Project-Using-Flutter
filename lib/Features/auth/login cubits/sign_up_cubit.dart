import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/data/repo/sign_up_repo.dart';
import 'package:sehatak/Features/auth/login%20cubits/sign_up_state.dart';
import 'package:sehatak/Features/auth/model/login_model.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:sehatak/core/utils/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  Future<void> signUpUser() async {
    // ✅ التحقق من صحة الفورم قبل إرسال البيانات
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      print("❌ الفورم غير صالح أو غير موجود");
      return;
    }

    emit(SignUpLoading());

    // ✅ جلب البيانات من SharedPreferences
    SaveUserData saveUserData = SaveUserData();
    Map<String, dynamic> userData = await saveUserData.getUserData();
    print('User Data Before Sending to Server: $userData');

    // ✅ إرسال البيانات المسترجعة بدلاً من استخدام TextEditingController
    Either<Failure, LoginModel> result = await signUpRepo.SignUpUser(
      fullName: userData['fullName'] ?? '',
      email: userData['email'] ?? '',
      mobileNumber: userData['mobileNumber'] ?? '',
      password: userData['password'] ?? '',
      passwordConfirm: userData['passwordConfirm'] ?? '',
      gender: userData['gender'] ?? '',
      age: userData['age'] ?? '',
      weight: userData['weight'] ?? '',
      height: userData['height'] ?? '',
      goal: userData['goal'] ?? '',
      physicalActivityLevel: userData['physicalActivityLevel'] ?? '',
    );

    result.fold(
      (failure) {
        print('❌ Error: ${failure.errorMessage}');
        emit(SignUpFailure(failure.errorMessage));
      },
      (loginModel) async {
        print('✅ SignUp Success');
        await CacheHelper.saveData(key: 'token', value: loginModel.id);
        emit(SignUpSuccess(loginModel));
      },
    );
  }
}
