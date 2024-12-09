import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sehatak/Features/Splash/Presentation/widgets/second_splash_screen.dart';
import 'package:sehatak/const.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToSecondSplashScreen();
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: secondaryColor,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 100.h,
              width: 140.w,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(97),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100.h,
              width: 140.w,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(97),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 214.h,
                  width: 214.w,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'N',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: usedColor,
                        ),
                      ),
                      TextSpan(
                        text: 'EZ',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'A',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: usedColor,
                        ),
                      ),
                      TextSpan(
                        text: 'M',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'k',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: usedColor,
                        ),
                      ),
                    ],
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

void goToSecondSplashScreen() {
  Future.delayed(const Duration(seconds: 2), () {
    Get.to(
      () => const SecondSplashScreen(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  });
}
