import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';

class DisplayProfileProviderFormWidget extends StatelessWidget {
  final ProviderModel? provider;

  const DisplayProfileProviderFormWidget({Key? key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            title: "Full name",
            width: double.infinity,
            controller: TextEditingController(text: provider?.fullName ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Years Of Experience",
            width: double.infinity,
            controller: TextEditingController(text: provider?.yearsOfExperience ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Mobile Number",
            width: double.infinity,
            controller: TextEditingController(text: provider?.mobileNumber ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Age",
            width: double.infinity,
            controller: TextEditingController(text: provider?.age ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Bio",
            width: double.infinity,
            controller: TextEditingController(text: provider?.bio ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Job Title",
            width: double.infinity,
            controller: TextEditingController(text: provider?.jobTitle ?? ''),
            enabled: false,
          ),
          CustomTextField(
            title: "Price Range",
            width: double.infinity,
            controller: TextEditingController(text: provider?.priceRange.toString() ?? ''),
            enabled: false,
          ),
          SizedBox(height: 20.h),

         Center(
  child: CustomButtomProfile(
    text: "Update Profile",
    onPressed: () {
      GoRouter.of(context).push(AppRouter.kProfileProviderView);
    },
    backgroundColor: accentColor,
  ),
),

        ],
      ),
    );
  }
}
