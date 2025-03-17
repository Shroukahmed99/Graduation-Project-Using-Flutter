import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class ProfileFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  ProfileFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            title: "Full name",
            width: double.infinity,
            controller: fullNameController,
            validator: validateFullName,
            hintText: "Mohamed Khaled",
          ),
          CustomTextField(
            title: "Email",
            width: double.infinity,
            controller: emailController,
            validator: validateEmail,
            hintText: "example@gmail.com",
          ),
          CustomTextField(
            title: "Mobile Number",
            width: double.infinity,
            controller: phoneController,
            validator: validatePhone,
            hintText: "01091175364",
          ),
          CustomTextField(
            title: "Date of birth",
            width: double.infinity,
            controller: birthDateController,
            validator: validateAge,
            hintText: "1/1/2002",
          ),
          CustomTextField(
            title: "Weight",
            width: double.infinity,
            controller: weightController,
            validator: validateWeight,
            hintText: "60 kg",
          ),
          CustomTextField(
            title: "Height",
            width: double.infinity,
            controller: heightController,
            validator: validateHeight,
            hintText: "165 CM",
          ),
          SizedBox(height: 20.h),
          Center(
            child: CustomButtomProfile(
              text: "Update Profile",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordSettingsView()),
                );
              },
              backgroundColor: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
