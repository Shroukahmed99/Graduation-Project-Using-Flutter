import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20cubit/profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_setting_body.dart';
import 'package:sehatak/core/widget/bottom_navigation_bar.dart';
import 'package:sehatak/core/widget/custom_bottom_home.dart';

class SettingProfileView extends StatelessWidget {
  const SettingProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => BottomSheetCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
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
