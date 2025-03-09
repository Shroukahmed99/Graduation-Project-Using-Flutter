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

    Either<Failure, UsersModel> result = await usersRepo.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
      (failure) {
        emit(LoginFailure(failure.errorMessage));
      },
      (loginModel) async {
        await CacheHelper.saveData(key: 'token', value: loginModel.token);
        emit(LoginSuccess(loginModel));
      },
    );
  }
}
