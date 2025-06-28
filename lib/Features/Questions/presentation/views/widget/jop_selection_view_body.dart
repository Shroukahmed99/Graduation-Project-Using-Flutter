import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/job%20cubit/job_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class JopSelectionViewBody extends StatelessWidget {
  const JopSelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w, bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomArrowBack(text: 'Back'),
          CustomSizedBox(height: 40.h),
          const CustomQuestionAndAswer(
            question: 'What’s Your Job?',
          ),
          CustomSizedBox(height: 100.h),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    String selectedJob =
                        (state is JobSelected) ? state.selectedJob : '';
                    return CircleImageTextWidget(
                      images: const [AssetImage('assets/images/medical-big.png')],
                      text: 'Physical Therapy',
                      isSelected: selectedJob == 'Physical Therapy',
                      onTap: () {
                        context.read<JobCubit>().selectJob('Physical Therapy');
                        CacheHelper.saveData(key: 'job', value: 'Physical Therapy');
                      },
                    );
                  },
                ),
                SizedBox(width: 23.w),
                BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    String selectedJob =
                        (state is JobSelected) ? state.selectedJob : '';
                    return CircleImageTextWidget(
                      images: const [AssetImage('assets/images/applebig.png')],
                      text: 'Nutirion',
                      isSelected: selectedJob == 'Nutirion',
                      onTap: () {
                        context.read<JobCubit>().selectJob('Nutirion');
                        CacheHelper.saveData(key: 'job', value: 'Nutirion');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Center(
            child: BlocBuilder<JobCubit, JobState>(
              builder: (context, state) {
                String selectedJob =
                    (state is JobSelected) ? state.selectedJob : '';
                return CircleImageTextWidget(
                  images: const [AssetImage('assets/images/Vector-big.png')],
                  text: 'Work Out',
                  isSelected: selectedJob == 'Work Out',
                  onTap: () {
                    context.read<JobCubit>().selectJob('Work Out');
                    CacheHelper.saveData(key: 'job', value: 'Work Out');
                  },
                );
              },
            ),
          ),
          CustomSizedBox(height: 60.h),
          BlocBuilder<JobCubit, JobState>(
            builder: (context, state) {
              String? selectedJob =
                  (state is JobSelected) ? state.selectedJob : null;

              return CustomButtom(
                text: 'Continue',
                onTap: () {
                  if (selectedJob == null || selectedJob.isEmpty) {
                    customSnackBar(
                        context, 'Please choose a job before continuing!');
                  } else {
                    GoRouter.of(context).push(AppRouter.kGenderSelectionViewService);
                  }
                },
              );
            },
          ),
          CustomSizedBox(height: 40.h),
        ],
      ),
    );
  }
}
