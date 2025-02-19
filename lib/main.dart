import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sehatak/Features/Splash/Presentation/widgets/first_splash_screen.dart';
import 'package:sehatak/const.dart';

void main() {
  runApp(const HealthMateApp());
}

class HealthMateApp extends StatelessWidget {
  const HealthMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Poppins',
                scaffoldBackgroundColor: backgroundColor,
              ),
              home: const FirstSplashScreen(),
            ));
  }
}
