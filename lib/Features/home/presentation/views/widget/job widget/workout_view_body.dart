import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_app_bar_jop.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_stor_by.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/workout_list_view.dart';

class WorkoutViewBody extends StatelessWidget {
  const WorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarJob(
          title: 'Work Out',
          image: 'assets/images/catgory1.png',
        ),
        SizedBox(height: 20.h),
        const CustomStorBy(),
        const Expanded(
          child: WorkoutListView(),
        ),
        const CustomBottomNavigationHomeClient(),
      ],
    );
  }
}
