import 'package:flutter/material.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/text_field_profile.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/setting_profile_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/buttom_text_forget_password.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/validate_function.dart';

class PasswordSettingBody extends StatelessWidget {
  PasswordSettingBody({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const CustomTextAndIconArrowback(
              text: 'Password Settings',
              colorText: usedColor,
              colorArrowIcon: usedColor,
            ),
            const SizedBox(height: 60),
            TextFieldProfile(
              width: 320,
              title: 'Current Password',
              hintText: '*************',
              controller: passwordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            const SizedBox(height: 20),
            const ButtomTextForgetPassword(),
            const SizedBox(height: 25),
            TextFieldProfile(
              width: 320,
              title: 'New Password',
              hintText: '*************',
              controller: newPasswordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            const SizedBox(height: 25),
            TextFieldProfile(
              width: 320,
              title: 'Confirm New Password',
              hintText: '*************',
              controller: confirmNewPasswordController,
              validator: validatePassword,
              hintTextColor: kPrimaryColor,
              isPassword: true, // Enable password toggle
            ),
            const SizedBox(height: 80),
            Center(
              child: CustomButtomProfile(
                text: "Change Password",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingProfileView()),
                  );
                  if (formKey.currentState!.validate()) {
                    // Handle password change logic here
                  }
                },
                backgroundColor: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
