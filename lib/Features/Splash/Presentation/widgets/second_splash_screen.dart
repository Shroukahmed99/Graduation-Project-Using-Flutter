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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToNextView();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nezamak',
                      style: TextStyle(
                        fontSize: 54.04.sp,
                        fontWeight: FontWeight.w800,
                        color: kPrimaryColor,
                      ),
                    )
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
  Future.delayed(const Duration(seconds: 2), () {
    Get.to(
      () => const OnBoardingView(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  });
}
