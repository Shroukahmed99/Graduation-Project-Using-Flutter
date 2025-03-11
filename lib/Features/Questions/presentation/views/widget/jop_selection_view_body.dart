import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/job%20cubit/job_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class JopSelectionViewBody extends StatelessWidget {
  const JopSelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 24.w),
      child: BlocProvider(
        create: (context) => JobCubit(), // Providing the Cubit
        child: Column(
          children: [
            const CustomArrowBack(text: 'Back'),
            CustomSizedBox(height: 25.h),
            const CustomQuestionAndAswer(
              question: 'What’s Your job',
              answer:
                  'A service provider can be a Nutritionist, Physiotherapist, or Gym Coach',
            ),
            const CustomSizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  BlocBuilder<JobCubit, JobState>(  // Fix the BlocBuilder
                    builder: (context, state) {
                      String selectedJob = (state is JobSelected) ? state.selectedJob : '';
                      return CircleImageTextWidget(
                        images: const [AssetImage('assets/images/medical-big.png')],
                        text: 'Physical Therapy',
                        isSelected: selectedJob == 'physical therapy', // Check if selected
                        onTap: () {
                          context.read<JobCubit>().selectJob('physical therapy'); // Update selection
                        },
                      );
                    },
                  ),
                  SizedBox(width: 23.w),
                  BlocBuilder<JobCubit, JobState>(  // Fix the BlocBuilder
                    builder: (context, state) {
                      String selectedJob = (state is JobSelected) ? state.selectedJob : '';
                      return CircleImageTextWidget(
                        images: const [AssetImage('assets/images/applebig.png')],
                        text: 'Nutrition',
                        isSelected: selectedJob == 'NUTRITION', // Check if selected
                        onTap: () {
                          context.read<JobCubit>().selectJob('NUTRITION'); // Update selection
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            BlocBuilder<JobCubit, JobState>(  // Fix the BlocBuilder
              builder: (context, state) {
                String selectedJob = (state is JobSelected) ? state.selectedJob : '';
                return CircleImageTextWidget(
                  images: const [AssetImage('assets/images/Vector-big.png')],
                  text: 'Work Out',
                  isSelected: selectedJob == 'work out', // Check if selected
                  onTap: () {
                    context.read<JobCubit>().selectJob('work out'); // Update selection
                  },
                );
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onTap: () {
                // Navigate to the next screen
                GoRouter.of(context).push(AppRouter.kGenderSelectionViewService);
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
