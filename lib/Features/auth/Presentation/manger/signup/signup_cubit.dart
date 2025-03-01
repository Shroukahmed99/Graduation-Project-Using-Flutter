import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sehatak/Features/auth/data/models/signup_model.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signUpRepo;
  final TextEditingController fullNameController =
      TextEditingController(text: 'nn');
  final TextEditingController emailController =
      TextEditingController(text: 'nn@gmail.com');
  final TextEditingController mobileNumberController =
      TextEditingController(text: '01099999999');
  final TextEditingController passwordController =
      TextEditingController(text: '123456789');
  final TextEditingController passwordConfirmController =
      TextEditingController(text: '123456789');
  final TextEditingController genderController =
      TextEditingController(text: 'male');

  final TextEditingController ageController = TextEditingController(text: '1');

  final TextEditingController weightController =
      TextEditingController(text: '20');

  final TextEditingController heightController =
      TextEditingController(text: '20');

  final TextEditingController goalController =
      TextEditingController(text: 'lose weight');
  final TextEditingController physicalActivityLevelController =
      TextEditingController(text: 'advance');

  final GlobalKey<FormState> signupKey = GlobalKey();
  //final Logger logger = Logger();

  SignupCubit(this.signUpRepo) : super(SignupInitial());

  Future<void> signupUser() async {
    emit(SignupLoding());

    var result = await signUpRepo.SignupUsres(
      fullName: fullNameController,
      email: emailController.text,
      mobileNumber: mobileNumberController.text,
      password: passwordController.text,
      passwordConfirm: passwordConfirmController.text,
      gender: genderController.text,
      age: ageController.text,
      weight: weightController.text,
      height: heightController.text,
      goal: goalController.text,
      physicalActivityLevel: physicalActivityLevelController.text,
    );

    result.fold(
      (failure) => emit(SignupFaliure(errorMessage: failure.errorMessage)),
      (signupModel) async {
        await _saveUserToCookie(signupModel);
        emit(SignupSuccess());
      },
    );
  }

  // ✅ تخزين البيانات في `SharedPreferences`
  Future<void> _saveUserToCookie(SignupModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user_cookie', userJson);
  }

  // ✅ جلب بيانات المستخدم من `SharedPreferences`
  Future<SignupModel?> getUserFromCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_cookie');
    if (userJson != null) {
      return SignupModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}
