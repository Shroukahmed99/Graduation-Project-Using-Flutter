import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/manger/cubit/sign_in_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/cubit/sign_in_state.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/buttom_text_forget_password.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_icon_buttom.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_question.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_signUpWith.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          customSnackBar(context, 'Login Successful');
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacement(AppRouter.kSuccessViews);
          });
        } else if (state is LoginFailure) {
          customSnackBar(
            context,
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
          child: Form(
            key: cubit.formKey,
            child: ListView(
              children: [
                const CustomTextAndIconArrowback(
                  text: 'Log In',
                ),
                SizedBox(height: 60.h),
                const CustomText(
                  title: 'Welcome',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                SizedBox(height: 60.h),
                CustomTextField(
                  title: 'Email',
                  hintText: 'Enter your email',
                  controller: cubit.emailController,
                  validator: validateEmail,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  title: 'Password',
                  hintText: '*************',
                  obscureText: true,
                  controller: cubit.passwordController,
                  validator: validatePassword,
                ),
                SizedBox(height: 20.h),
                const ButtomTextForgetPassword(),
                SizedBox(height: 25.h),
                state is LoginLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: 'Log In',
                        onTap: () {
                          cubit.loginUser();
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
          ),
        );
      },
    );
  }
}
