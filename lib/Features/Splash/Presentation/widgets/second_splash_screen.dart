import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/background_image.dart';

import '../../../on Boarding/Presentation/on_boarding_view.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => const OnBoardingView(),
        transition: Transition.fade,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(image: 'assets/images/0.png'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 25.47.sp,
                    fontWeight: FontWeight.w700,
                    color: backgroundColor,
                  ),
                ),
                SizedBox(height: 10.h),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Text(
                    'Nezamk',
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
