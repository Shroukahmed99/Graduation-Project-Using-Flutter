import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/background_image.dart';

import '../../../on Boarding/Presentation/on_boarding_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToNextView();
    });
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(image: 'assets/images/1.png'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 25.47,
                    fontWeight: FontWeight.w700,
                    color: backgroundColor,
                  ),
                )
                    .animate()
                    .fadeIn(duration: Duration(seconds: 1))
                    .moveY(begin: -30, end: 0),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Health',
                      style: TextStyle(
                        fontSize: 54.04,
                        fontWeight: FontWeight.w800,
                        color: kPrimaryColor,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: Duration(seconds: 1))
                        .moveX(begin: -30, end: 0),
                    const SizedBox(width: 5),
                    const Text(
                      'Mate',
                      style: TextStyle(
                        fontSize: 54.04,
                        fontWeight: FontWeight.w800,
                        color: backgroundColor,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: Duration(seconds: 1))
                        .moveX(begin: 30, end: 0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void goToNextView() {
  Future.delayed(Duration(seconds: 3), () {
    Get.to(() => OnBoardingView(), transition: Transition.fade);
  });
}
