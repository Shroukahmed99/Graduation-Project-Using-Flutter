import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Forgotten Password',
          ),
          SizedBox(
            height: 60.h,
          ),
          const CustomText(
            title: "Forgot Password?",
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          SizedBox(
            height: 60.h,
          ),
          const CustomSubTitle(
            subTitle: 'Enter your email address',
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            hintText: 'example@example.com',
            inputType: TextInputType.emailAddress,
            onSaved: (String) {},
          ),
          SizedBox(
            height: 140.h,
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
