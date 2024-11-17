import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/Custom_sub_title.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Widgets/custom_text_field.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class SetPasswordViewBody extends StatelessWidget {
  const SetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Set Password',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            subTitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          ),
          const SizedBox(
            height: 60,
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
            inputType: TextInputType.visiblePassword,
            onSaved: (String) {},
          ),
          const SizedBox(
            height: 90,
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
