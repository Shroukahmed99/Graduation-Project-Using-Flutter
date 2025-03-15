import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/gender%20cubit/gender_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class GenderSelectionViewService extends StatelessWidget {
  const GenderSelectionViewService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 24.w),
          child: Column(
            children: [
              const CustomArrowBack(text: 'Back'),
              CustomSizedBox(height: 25.h),
              const CustomQuestionAndAswer(
                question: 'What’s Your Gender',
              ),
              const CustomSizedBox(height: 15),
              BlocBuilder<GenderCubit, GenderState>(
                builder: (context, state) {
                  String? selectedGender =
                      (state is GenderSelected) ? state.gender : null;

                  return Column(
                    children: [
                      CircleImageTextWidget(
                        images: const [AssetImage('assets/images/male.png')],
                        text: 'Male',
                        isSelected: selectedGender == 'male',
                        onTap: () {
                          context.read<GenderCubit>().selectGender('male');
                        },
                      ),
                      CustomSizedBox(height: 40.h),
                      CircleImageTextWidget(
                        images: const [AssetImage('assets/images/female.png')],
                        text: 'Female',
                        isSelected: selectedGender == 'female',
                        onTap: () {
                          context.read<GenderCubit>().selectGender('female');
                        },
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<GenderCubit, GenderState>(
                builder: (context, state) {
                  bool isButtonEnabled = state is GenderSelected;
                  return CustomButton(
                    text: 'Continue',
                    onTap: isButtonEnabled
                        ? () {
                            GoRouter.of(context)
                                .push(AppRouter.kAgeSelectionProviderScreen);
                          }
                        : null,
                  );
                },
              ),
              CustomSizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
