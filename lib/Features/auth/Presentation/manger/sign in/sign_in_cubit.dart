import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/sign%20in/sign_in_state.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  final UsersRepo usersRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit(this.usersRepo) : super(LoginInitial());

  Future<void> loginUser() async {
    // ✅ التحقق من صحة الفورم قبل إرسال البيانات
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      print("❌ الفورم غير صالح أو غير موجود");
      return;
    }

    emit(LoginLoading());

    try {
       print("Email: ${emailController.text.trim()}");
    print("Password: ${passwordController.text.trim()}");
      Either<Failure, UsersModel> result = await usersRepo.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      result.fold(
        (failure) {
          print("❌ Login Failed: ${failure.errorMessage}");
          emit(LoginFailure(failure.errorMessage));
        },
        (loginModel) async {
          await CacheHelper.saveData(key: 'token', value: loginModel.token);

          // ✅ تنظيف الحقول بعد تسجيل الدخول
          emailController.clear();
          passwordController.clear();

          print("✅ Login Successful - Token: ${loginModel.token}");
          emit(LoginSuccess(loginModel));
          print("Token sent to server: ${loginModel.token}");
        },
      );
    } catch (e) {
      print("🚨 Unexpected Error: $e");
      emit(LoginFailure("Something went wrong. Please try again."));
    }
  }

  @override
  Future<void> close() {
    // ✅ تحرير الموارد عند إغلاق الكابت
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
