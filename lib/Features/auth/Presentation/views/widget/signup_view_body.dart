import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup/signup_cubit.dart';
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

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
      child: ListView(
        children: [
          const CustomTextAndIconArrowback(
            text: 'Create Account',
          ),
          SizedBox(height: 20.h),
          const CustomText(
            title: "Let's start!",
          ),
          CustomTextField(
            title: 'Full name',
            hintText: 'name',
            controller: signupCubit.fullNameController,
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            title: 'Email',
            hintText: 'email',
            controller: signupCubit.emailController,
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            title: 'Mobile number',
            hintText: '+020 103 0136 999',
            controller: signupCubit.mobileNumberController,
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            title: 'Password',
            hintText: '*************',
            controller: signupCubit.passwordController,
            obscureText: true,
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            title: 'Confirm Password',
            hintText: '*************',
            controller: signupCubit.passwordConfirmController,
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          const CustomTextWithSignup(),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'Sign Up',
            onTap: () {
              // عند الضغط على التسجيل، يتم تخزين البيانات والانتقال للخطوة التالية
              GoRouter.of(context).push(AppRouter.kGenderSelectionScreen);
            },
          ),
          SizedBox(height: 15.h),
          const CustomTextSignupwith(),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(icon: FontAwesomeIcons.google),
                CustomIconButton(icon: Icons.facebook),
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
