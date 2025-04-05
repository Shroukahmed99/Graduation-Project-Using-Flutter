// setting_profile_view.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_setting_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_home.dart';

class SettingProfileView extends StatelessWidget {
  const SettingProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileImageCubit()),
        BlocProvider(create: (context) => BottomSheetCubit()),
        BlocProvider(create: (context) => LogoutCubit(ProfileRepositoryImpl(ApiService(Dio())))),
        BlocProvider(create: (context) => DeleteAccountCubit(ProfileRepositoryImpl(ApiService(Dio())))),
        BlocProvider(
          create: (context) => ProfileClientCubit(ProfileRepositoryImpl(ApiService(Dio())))..getClientData(),
        ),
      ],
      child: BlocBuilder<BottomSheetCubit, BottomSheetState>(
        builder: (context, state) {
          bool isBottomSheetVisible = state is BottomSheetVisible;

          return Scaffold(
            backgroundColor: isBottomSheetVisible
                ? Colors.black.withOpacity(0.5)
                : Colors.white,
            body: const SafeArea(
              child: Stack(
                children: [
                  ProfileSettingBody(),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}