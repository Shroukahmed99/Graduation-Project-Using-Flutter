import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/sign%20in/sign_in_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/login_view_body.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        UsersRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
