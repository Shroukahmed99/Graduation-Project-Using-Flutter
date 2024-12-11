import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/login_view.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Signup/widgets/custom_text_with_signup.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_icon_buttom.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_question.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_signUpWith.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Create Account',
          ),
           SizedBox(
            height: 60.h,
          ),
          const CustomText(
            title: "let's start!",
          ),
          const CustomSubTitle(
            subTitle: 'Full name',
          ),
           SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            hintText: 'Shrouk Kaoud',
            inputType: TextInputType.name,
            onSaved: (String) {},
          ),
           SizedBox(
            height: 10.h,
          ),
          const CustomSubTitle(
            subTitle: 'Email or Mobile Number',
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            hintText: '+020 103 0136 999',
            onSaved: (String) {},
            inputType: TextInputType.number,
          ),
           SizedBox(
            height: 10.h,
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
            height: 25.h,
          ),
          const CustomTextWithSignup(),
           SizedBox(
            height: 20.h,
          ),
          CustomButton(
            text: 'Sign Up',
            onTap: () {},
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
            child:const Row(
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
            text: 'Login In',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
