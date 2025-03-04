import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_select_activity.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/sign_up_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/sign_up_state.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class PhysicalActivityViewBody extends StatefulWidget {
  const PhysicalActivityViewBody({super.key});

  @override
  State<PhysicalActivityViewBody> createState() =>
      _PhysicalActivityViewBodyState();
}

class _PhysicalActivityViewBodyState extends State<PhysicalActivityViewBody> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          customSnackBar(context, 'Success');
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacement(AppRouter.kSuccessViews);
          });
        } else if (state is SignUpFailure) {
          customSnackBar(context, state.errorMessage);
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
          });
        }
      },
      child: Form(
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.w),
              child: const CustomArrowBack(text: 'Back'),
            ),
            CustomSizedBox(height: 25.h),
            const CustomQuestionAndAswer(
              question: 'Physical Activity Level',
              answer:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            ),
            CustomSizedBox(height: 120.h),
            CustomSelectActivity(
              options: const ['Beginner', 'Intermediate', 'Advance'],
              onSelect: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            const Spacer(),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                bool isLoading = state is SignUpLoading;

                return isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        text: 'Continue',
                        onTap: () {
                          if (context
                              .read<SignUpCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            if (selectedIndex != null) {
                              context.read<SignUpCubit>().signUpUser();
                            } else {
                              customSnackBar(
                                  context, 'Please select activity level');
                            }
                          }
                        },
                      );
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
