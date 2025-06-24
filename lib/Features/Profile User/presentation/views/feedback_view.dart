import 'package:flutter/material.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20feedbace/feedback_body.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: FeedbackBody(),
              bottomNavigationBar:  CustomBottomNavigationHomeProvider(),

    );
  }
}
