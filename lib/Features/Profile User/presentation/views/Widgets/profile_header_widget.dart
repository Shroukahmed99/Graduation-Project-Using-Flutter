import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_image_with_icon.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_info_card_section.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_user_info_texts.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/const.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final File? pickedImage;
  final Future<void> Function() onPickImage;

  const ProfileHeaderWidget({
    Key? key,
    required this.pickedImage,
    required this.onPickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 291.h,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 30.h),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTextAndIconArrowback(
                text: "My Profile",
                colorArrowIcon: Colors.black,
                colorText: Colors.black,
              ),
              SizedBox(height: 20.h),
              ProfileImageWithIcon(
                imageFile: pickedImage,
                onTap: onPickImage,
              ),
              SizedBox(height: 5.h),
              const ProfileUserInfoTexts(),
              SizedBox(height: 15.h),
            ],
          ),
        ),
        Positioned(
          bottom: -5.h,
          left: 0,
          right: 0,
          child: const ProfileInfoCardSection(),
        ),
      ],
    );
  }
}
