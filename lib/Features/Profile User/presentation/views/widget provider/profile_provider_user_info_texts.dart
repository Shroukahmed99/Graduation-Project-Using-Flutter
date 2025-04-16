// profile_provider_info_texts.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/update_profile_provider_model.dart';
import 'package:sehatak/const.dart';

class ProfileProviderUserInfoTexts extends StatelessWidget {
  final UpdatedProvider provider;

  const ProfileProviderUserInfoTexts({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          provider.fullName ?? 'No Name',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
       
        Text(
provider.jobTitle ,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: secondaryColor,
          ),
        ),
         Text(
provider.bio ,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
