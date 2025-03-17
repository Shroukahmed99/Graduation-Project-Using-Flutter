import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20cubit/profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_form_Widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_header_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileCubit, File?>(
          builder: (context, pickedImage) {
            return ProfileHeaderWidget(
              pickedImage: pickedImage,
              onPickImage: () => context.read<ProfileCubit>().pickImage(),
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
                  SizedBox(height: 10.h),
                  ProfileFormWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
