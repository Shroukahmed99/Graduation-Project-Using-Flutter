import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/login_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_with_signup.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_icon_buttom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_signUpWith.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey();

  Future<void> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    await sharedPreferences.setString('fullName', fullNameController.text);
    await sharedPreferences.setString('email', emailController.text);
    await sharedPreferences.setString('mobileNumber', mobileNumberController.text);
    await sharedPreferences.setString('password', passwordController.text);
    await sharedPreferences.setString('passwordConfirm', passwordConfirmController.text);
    
    print("Data Saved Successfully ✅");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: Form(
        key: signupKey,
        child: ListView(
          children: [
            const CustomTextAndIconArrowback(text: 'Create Account'),
            SizedBox(height: 20.h),
            const CustomText(title: "Let's start!"),
            CustomTextField(
              title: 'Full name',
              hintText: 'Enter your name',
              controller: fullNameController,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              title: 'Email',
              hintText: 'Enter your email',
              controller: emailController,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              title: 'Mobile number',
              hintText: '+020 103 0136 999',
              controller: mobileNumberController,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              title: 'Password',
              hintText: '*************',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              title: 'Confirm Password',
              hintText: '*************',
              obscureText: true,
              controller: passwordConfirmController,
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: 'Sign Up',
              onTap: () {
                if (signupKey.currentState!.validate()) {
                  saveData(); // ✅ هنا بنخزن البيانات
                  GoRouter.of(context).push(AppRouter.kGenderSelectionScreen);
                }
              },
            ),
            SizedBox(height: 15.h),
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
      ),
    );
  }
}
