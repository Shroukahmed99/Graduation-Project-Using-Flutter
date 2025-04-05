// profile_user_info_texts.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_model.dart';
import 'package:sehatak/const.dart';

class ProfileUserInfoTexts extends StatelessWidget {
  final ClientModel? client;

  const ProfileUserInfoTexts({Key? key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (client == null) {
      return Column(
        children: [
          Text(
            'Loading...',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please wait',
            style: TextStyle(
              fontSize: 14.sp,
              color: secondaryColor,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Text(
          client!.fullName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
          ),
        ),
        Text(
          client!.user.email,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            color: secondaryColor,
          ),
        ),
        Text(
          "Age: ${client!.age} years old",
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
