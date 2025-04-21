// profile_body.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/profile_form_Widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/profile_header_widget.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileClientCubit, ClientState>(
      listener: (context, state) {
        if (state is ClientFailure) {
          customSnackBar(context, (state.message));
        }
      },
      builder: (context, state) {
        if (state is ClientLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        if (state is ClientSuccess) {
          final client = state.client;

          return Column(
            children: [
              BlocBuilder<ProfileImageCubit, File?>(
                builder: (context, pickedImage) {
                  return ProfileHeaderWidget(client: client , showEditIcon: true,onTap:() { 
                  GoRouter.of(context).pushReplacement(AppRouter.kSettingProfileView);
                },
        );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        ProfileFormWidget(client: client),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
