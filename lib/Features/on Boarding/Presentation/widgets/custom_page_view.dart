import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/background_image.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.controller});
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return PageView(controller: controller, children: const [
      BackgroundImage(
          image:
              'assets/images/beautiful-young-sporty-woman-training-workout-gym 3.png'),
      BackgroundImage(
          image:
              'assets/images/beautiful-young-sporty-woman-training-workout-gym 3 (1).png'),
      BackgroundImage(
          image:
              'assets/images/beautiful-young-sporty-woman-training-workout-gym 3.png'),
    ]);
  }
}
