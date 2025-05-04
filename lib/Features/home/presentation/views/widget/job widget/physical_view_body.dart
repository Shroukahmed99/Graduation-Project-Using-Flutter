import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_app_bar_jop.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_stor_by.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/physical_list_view.dart';

class PhysicalViewBody extends StatelessWidget {
  const PhysicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarJob(
              title: 'Physical Therapy',
              image: 'assets/images/category3.png',
            ),
            SizedBox(height: 20.h),
            const CustomStorBy(),
            const PhysicalListView(),
          ],
        ),
      ),
    );
  }
}
