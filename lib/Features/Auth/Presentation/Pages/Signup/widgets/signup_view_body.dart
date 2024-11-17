import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/login_view.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Signup/widgets/custom_text_with_signup.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_icon_buttom.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_question.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_signUpWith.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Create Account',
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomText(
            title: "let's start!",
          ),
          const CustomSubTitle(
            subTitle: 'Full name',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'example@example.com',
            onChanged: (String) {},
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSubTitle(
            subTitle: 'Email or Mobile Number',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: '+020 103 0136 999',
            onChanged: (String) {},
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSubTitle(
            subTitle: 'Password',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: '*************',
            onChanged: (String) {},
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomSubTitle(
            subTitle: ' Confirm Password',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: '*************',
            onChanged: (String) {},
          ),
          const SizedBox(
            height: 25,
          ),
          const CustomTextWithSignup(),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Sign Up',
            onTap: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextSignupwith(),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Row(
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
