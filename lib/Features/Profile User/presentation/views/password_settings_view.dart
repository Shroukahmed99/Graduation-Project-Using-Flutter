// password_settings_view.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20change%20cubit/password_change_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20visibility%20cubit/password_visibility_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/password_setting_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

class PasswordSettingsView extends StatelessWidget {
  const PasswordSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordVisibilityCubit>(
          create: (context) => PasswordVisibilityCubit(),
        ),
        BlocProvider<PasswordChangeCubit>(
          create: (context) => PasswordChangeCubit(ProfileRepositoryImpl(ApiService(Dio()))),
        ),
      ],
      child: Scaffold(
        body: PasswordSettingBody(),
      ),
    );
  }
}