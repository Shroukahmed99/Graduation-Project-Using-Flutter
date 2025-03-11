import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/physical_activity_view_body.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20client/sign_up_client_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';

class PhysicalActivityView extends StatelessWidget {
  const PhysicalActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SignUpCubit(
          UsersRepoImpl(
            ApiService(
              Dio(),
            ),
          ),
        );
      },
      child: const Scaffold(
        body: PhysicalActivityViewBody(),
      ),
    );
  }
}
