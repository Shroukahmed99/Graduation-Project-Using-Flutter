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
  final TextEditingController fullNameController = TextEditingController(text: 'Ahmed Ali');
  final TextEditingController emailController = TextEditingController(text: 'ahmedali@gmail.com');
  final TextEditingController mobileNumberController = TextEditingController(text: '01012345678');
  final TextEditingController passwordController = TextEditingController(text: 'Ahmed@123');
  final TextEditingController passwordConfirmController = TextEditingController(text: 'Ahmed@123');
  final TextEditingController genderController = TextEditingController(text: 'male');
  final TextEditingController ageController = TextEditingController(text: '25');
  final TextEditingController weightController = TextEditingController(text: '75');
  final TextEditingController heightController = TextEditingController(text: '180');
  final TextEditingController goalController = TextEditingController(text: 'lose weight');
  final TextEditingController physicalActivityLevelController = TextEditingController(text: 'Intermediate');
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  Future<void> signUpUser() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignUpLoading());

    SaveUserData saveUserData = SaveUserData();
    Map<String, dynamic> userData = await saveUserData.getUserData();
  print('User Data Before Sending to Server: $userData');
    Either<Failure, LoginModel> result = await signUpRepo.SignUpUser(
       fullName: fullNameController.text,
      email: emailController.text,
      mobileNumber: mobileNumberController.text,
      password: passwordController.text,
      passwordConfirm: passwordConfirmController.text,
      gender: genderController.text,
      age: ageController.text ,
      weight: weightController.text ,
      height: heightController.text,
      goal: goalController.text,
      physicalActivityLevel: physicalActivityLevelController.text,
    );

    result.fold(
      (failure) {
        print('Error: ${failure.errorMessage}');
        emit(SignUpFailure(failure.errorMessage));
      },
      (loginModel) async {
        print('SignUp Success');
        await CacheHelper.saveData(key: 'token', value: loginModel.id);
        emit(SignUpSuccess(loginModel));
      },
    );
  }

  Future<void> getUserData() async {
    SaveUserData saveUserData = SaveUserData();
    Map<String, dynamic> userData = await saveUserData.getUserData();

    print('User Data Loaded Successfully ✅');
  }
}
