import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/gender/gender_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup/signup_cubit.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class GenderSelectionViews extends StatelessWidget {
  const GenderSelectionViews({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();

    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 24.w),
          child: Form(
            key: signupCubit.signupKey,
            child: Column(
              children: [
                const CustomArrowBack(text: 'Back'),
                CustomSizedBox(height: 25.h),
                const CustomQuestionAndAswer(
                  question: 'What’s Your Gender',
                  answer:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
                const CustomSizedBox(height: 15),

                // ✅ BlocBuilder لتحديث حالة الجنس
                BlocBuilder<GenderCubit, GenderState>(
                  builder: (context, state) {
                    String? selectedGender;
                    if (state is GenderSelected) {
                      selectedGender = state.gender;
                    }
                    return Column(
                      children: [
                        CircleImageTextWidget(
                          images: const [AssetImage('assets/images/male.png')],
                          text: 'Male',
                          isSelected: selectedGender == 'Male',
                          onTap: () {
                            context.read<GenderCubit>().selectGender('Male');
                            signupCubit.saveUserData(
                                gender: 'Male'); // ✅ تخزين البيانات
                          },
                        ),
                        CustomSizedBox(height: 15.h),
                        CircleImageTextWidget(
                          images: const [
                            AssetImage('assets/images/female.png')
                          ],
                          text: 'Female',
                          isSelected: selectedGender == 'Female',
                          onTap: () {
                            context.read<GenderCubit>().selectGender('Female');
                            signupCubit.saveUserData(
                                gender: 'Female'); // ✅ تخزين البيانات
                          },
                        ),
                      ],
                    );
                  },
                ),
                const Spacer(),

                // ✅ زر المتابعة مع التحقق من الاختيار
                BlocBuilder<GenderCubit, GenderState>(
                  builder: (context, state) {
                    bool isButtonEnabled = state is GenderSelected;
                    return CustomButton(
                      text: 'Continue',
                      onTap: isButtonEnabled
                          ? () {
                              if (signupCubit.signupKey.currentState!
                                  .validate()) {
                                GoRouter.of(context)
                                    .push(AppRouter.kAgeSelectionScreen);
                              }
                            }
                          : null,
                      // تعطيل الزر إذا لم يتم الاختيار
                    );
                  },
                ),
                CustomSizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
