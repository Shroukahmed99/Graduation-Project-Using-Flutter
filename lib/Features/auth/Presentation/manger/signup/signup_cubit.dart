import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sehatak/Features/auth/data/models/signup_model.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signUpRepo;

  // ✅ متغيرات التحكم في الحقول
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController =
      TextEditingController(); // إزالة القيمة الافتراضية
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController physicalActivityLevelController =
      TextEditingController();

  final GlobalKey<FormState> signupKey =
      GlobalKey(); // مفتاح التحقق من صحة النموذج

  SignupCubit(this.signUpRepo) : super(SignupInitial());

  // ✅ دالة لحفظ البيانات عند إدخالها أو التنقل بين الصفحات
  void saveUserData({
    String? fullName,
    String? email,
    String? mobileNumber,
    String? password,
    String? passwordConfirm,
    String? gender,
    String? age,
    String? weight,
    String? height,
    String? goal,
    String? physicalActivityLevel,
  }) {
    fullNameController.text = fullName ?? fullNameController.text;
    emailController.text = email ?? emailController.text;
    mobileNumberController.text = mobileNumber ?? mobileNumberController.text;
    passwordController.text = password ?? passwordController.text;
    passwordConfirmController.text =
        passwordConfirm ?? passwordConfirmController.text;
    genderController.text = gender ?? genderController.text;
    ageController.text = age ?? ageController.text;
    weightController.text = weight ?? weightController.text;
    heightController.text = height ?? heightController.text;
    goalController.text = goal ?? goalController.text;
    physicalActivityLevelController.text =
        physicalActivityLevel ?? physicalActivityLevelController.text;
  }

  // ✅ دالة الإرسال عند الضغط على الزر في الصفحة الأخيرة فقط
  Future<void> signupUser() async {
    if (!signupKey.currentState!.validate()) {
      return;
    }

    emit(SignupLoding());

    var result = await signUpRepo.SignupUsres(
      fullName: fullNameController.text,
      email: emailController.text,
      mobileNumber: mobileNumberController.text,
      password: passwordController.text,
      passwordConfirm: passwordConfirmController.text,
      gender: genderController.text,
      age: int.tryParse(ageController.text) ?? 0, // ✅ التحويل إلى int
      weight:
          double.tryParse(weightController.text) ?? 0.0, // ✅ التحويل إلى double
      height:
          double.tryParse(heightController.text) ?? 0.0, // ✅ التحويل إلى double
      goal: goalController.text,
      physicalActivityLevel: physicalActivityLevelController.text,
    );

    result.fold(
      (failure) => emit(SignupFaliure(errorMessage: failure.errorMessage)),
      (signupModel) async {
        await _saveUserToCookie(signupModel); // ✅ حفظ بيانات المستخدم
        clearControllers(); // ✅ تنظيف الحقول بعد النجاح
        emit(SignupSuccess());
      },
    );
  }

  // ✅ تخزين بيانات المستخدم في `SharedPreferences`
  Future<void> _saveUserToCookie(SignupModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user_cookie', userJson);
  }

  // ✅ استرجاع بيانات المستخدم من `SharedPreferences`
  Future<SignupModel?> getUserFromCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_cookie');
    if (userJson != null) {
      return SignupModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  // ✅ تنظيف البيانات بعد نجاح التسجيل
  void clearControllers() {
    fullNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    genderController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();
    goalController.clear();
    physicalActivityLevelController.clear();
  }
}
