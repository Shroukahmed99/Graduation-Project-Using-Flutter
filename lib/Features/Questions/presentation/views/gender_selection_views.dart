import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/gender/gender_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderSelectionView extends StatefulWidget {
  const GenderSelectionView({super.key});

  @override
  State<GenderSelectionView> createState() => _GenderSelectionViewState();
}

class _GenderSelectionViewState extends State<GenderSelectionView> {
  String? selectedGender;

  Future<void> saveData() async {
    if (selectedGender != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('gender', selectedGender!);
      print("Data Saved Successfully ✅");
    }
  }

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
                answer:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              const CustomSizedBox(height: 15),
              BlocBuilder<GenderCubit, GenderState>(
                builder: (context, state) {
                  if (state is GenderSelected) {
                    selectedGender = state.gender;
                  }
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
                      CustomSizedBox(height: 15.h),
                      CircleImageTextWidget(
                        images: const [AssetImage('assets/images/female.png')],
                        text: 'Female',
                        isSelected: selectedGender == 'Female',
                        onTap: () {
                          context.read<GenderCubit>().selectGender('Female');
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
                            saveData();
                            GoRouter.of(context)
                                .push(AppRouter.kAgeSelectionScreen);
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
