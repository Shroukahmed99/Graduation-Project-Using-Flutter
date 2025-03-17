import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/bottom_navigation_bar.dart';
import 'package:sehatak/core/widget/custom_bottom_home.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_app_bar_jop.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_stor_by.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/physical_list_view.dart';

class PhysicalViewBody extends StatelessWidget {
  const PhysicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarJob(
          title: 'Physical Therapy',
          image: 'assets/images/category3.png',
        ),
        SizedBox(height: 20),
        CustomStorBy(),
        Expanded(
          child: PhysicalListView(),
        ),
        CustomBottomNavBar(),
      ],
    );
  }
}
