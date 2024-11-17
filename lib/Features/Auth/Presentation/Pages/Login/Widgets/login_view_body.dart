import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_button.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/Widgets/buttom_text_forget_password.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_question.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_signUpWith.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_icon_buttom.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(),
          const SizedBox(
            height: 60,
          ),
          const CustomText(),
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
          const SizedBox(
            height: 10,
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
          const CustomTextQuestion(),
        ],
      ),
    );
  }
}
