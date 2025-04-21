import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/const.dart';

class ProfileProviderUserInfoTexts extends StatelessWidget {
  final ProviderModel? provider;

  const ProfileProviderUserInfoTexts({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (provider == null) {
      return Column(
        children: [
          Text(
"Data not found",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: secondaryColor,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Text(
          provider!.fullName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          provider!.jobTitle,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: secondaryColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          provider!.bio,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: secondaryColor,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}