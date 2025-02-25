import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/login_signIn_forget/Presentation/views/widget/Custom_sub_title.dart';
import 'package:sehatak/Features/login_signIn_forget/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/login_signIn_forget/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/login_signIn_forget/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class SetPasswordViewBody extends StatelessWidget {
  const SetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Set Password',
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomText(
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          SizedBox(
            height: 60.h,
          ),
          const CustomSubTitle(
            subTitle: 'Password',
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            hintText: '*************',
            inputType: TextInputType.visiblePassword,
            onSaved: (String) {},
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomSubTitle(
            subTitle: ' Confirm Password',
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            hintText: '*************',
            inputType: TextInputType.visiblePassword,
            onSaved: (String) {},
          ),
          SizedBox(
            height: 90.h,
          ),
          CustomButton(
            text: 'Reset Password',
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SetPasswordView()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
