// setting_profile_view.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_setting_provider_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class SettingProfileProviderView extends StatelessWidget {
  const SettingProfileProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileImageCubit()),
        BlocProvider(create: (context) => BottomSheetCubit()),
        BlocProvider(create: (context) => LogoutCubit(ProfileRepositoryImpl(ApiService(Dio())))),
        BlocProvider(create: (context) => DeleteAccountCubit(ProfileRepositoryImpl(ApiService(Dio())))),
        BlocProvider(
          create: (context) => ProfileProviderCubit(ProfileRepositoryImpl(ApiService(Dio())))..getProviderData(),
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
                  ProfileSettingProviderBody(),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomNavigationHomeProvider(),
          );
        },
      ),
    );
  }
}