import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup/signup_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/signup_view_body.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        SignupRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: const Scaffold(
        body: SignupViewBody(),
      ),
    );
  }
}
