import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/background_image.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(children: const [
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
