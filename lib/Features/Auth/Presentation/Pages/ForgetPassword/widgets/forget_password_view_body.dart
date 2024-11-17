import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Set%20Password/forget_password_view.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Forgotten Password',
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomText(
            title: "Forgot Password?",
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomSubTitle(
            subTitle: 'Enter your email address',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'example@example.com',
            inputType: TextInputType.emailAddress,
            onSaved: (String) {},
          ),
          const SizedBox(
            height: 140,
          ),
          CustomButton(
            text: 'Continue',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetPasswordView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
