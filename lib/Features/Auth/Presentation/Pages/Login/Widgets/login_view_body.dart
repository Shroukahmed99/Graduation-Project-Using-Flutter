import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/Widgets/buttom_text_forget_password.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Signup/signup_view.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_icon_buttom.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_question.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_signUpWith.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Log In',
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomText(
            title: 'Welcome',
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          const SizedBox(
            height: 60,
          ),
          const CustomSubTitle(
            subTitle: 'Username or email',
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
            inputType: TextInputType.visiblePassword,
            onSaved: (String) {},
          ),
          const SizedBox(
            height: 20,
          ),
          const ButtomTextForgetPassword(),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            text: 'Log In',
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
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupView()),
              );
            },
            text: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
