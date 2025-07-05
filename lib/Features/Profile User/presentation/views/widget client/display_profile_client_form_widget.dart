import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_text_field.dart';

class DisplayProfileClientFormWidget extends StatelessWidget {
  final ClientModel client;

  const DisplayProfileClientFormWidget({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          title: "Full name",
          width: double.infinity,
          controller: TextEditingController(text: client.fullName),
          enabled: false,
        ),
        CustomTextField(
          title: "Mobile Number",
          width: double.infinity,
          controller: TextEditingController(text: client.mobileNumber),
          enabled: false,
        ),
        CustomTextField(
          title: "Age",
          width: double.infinity,
          controller: TextEditingController(text: client.age),
          enabled: false,
        ),
        CustomTextField(
          title: "Weight",
          width: double.infinity,
          controller: TextEditingController(text: client.weight),
          enabled: false,
        ),
        CustomTextField(
          title: "Height",
          width: double.infinity,
          controller: TextEditingController(text: client.height),
          enabled: false,
        ),
        SizedBox(height: 12.h),
        CustomTextField(
          title: "Physical Activity Level",
          width: double.infinity,
          controller: TextEditingController(text: client.physicalActivityLevel),
          enabled: false,
        ),
        SizedBox(height: 12.h),
        CustomTextField(
          title: "Fitness Goal",
          width: double.infinity,
          controller: TextEditingController(text: client.goal),
          enabled: false,
        ),
        SizedBox(height: 20.h),
        Center(
          child: CustomButtomProfile(
            text: "Edit Profile",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kProfileView);
            },
            backgroundColor: accentColor,
          ),
        ),
      ],
    );
  }
}
