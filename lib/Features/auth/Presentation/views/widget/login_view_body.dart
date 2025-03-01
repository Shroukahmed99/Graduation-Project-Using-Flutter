import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/buttom_text_forget_password.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_icon_buttom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_signUpWith.dart';
import 'package:sehatak/Features/success%20register/introduction_screen.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Log In',
          ),
          SizedBox(
            height: 60.h,
          ),
          const CustomText(
            title: 'Welcome',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          SizedBox(
            height: 60.h,
          ),
          // CustomTextField(
          //   title: 'Username or email',
          //   hintText: 'example@example.com',
          // ),
          SizedBox(
            height: 10.h,
          ),
          // CustomTextField(
          //   title: 'Password',
          //   hintText: '*************',
          // ),
          SizedBox(
            height: 20.h,
          ),
          const ButtomTextForgetPassword(),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            text: 'Log In',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IntroductionScreen()),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomTextSignupwith(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: FontAwesomeIcons.google,
                ),
                CustomIconButton(
                  icon: Icons.facebook,
                ),
              ],
            ),
          ),
          CustomTextQuestion(
            onPress: () {
              GoRouter.of(context).push(AppRouter.kRoleSelectionScreen);
            },
            text: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
