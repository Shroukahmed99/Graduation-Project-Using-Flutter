import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/forgetpassword/forget_password_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/forget_password_view_body.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPasswordCubit(UsersRepoImpl(ApiService(Dio()))),
      child: Scaffold(
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
