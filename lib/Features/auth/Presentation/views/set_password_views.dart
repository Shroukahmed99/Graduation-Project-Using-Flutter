import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/set%20password/set_password_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/set_password_view_body.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPasswordCubit(
        usersRepo: UsersRepoImpl(ApiService(Dio())),
      ),
      child: Scaffold(body: SetPasswordViewBody()),
    );
  }
}
