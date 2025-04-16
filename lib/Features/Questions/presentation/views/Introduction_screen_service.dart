import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';
import 'package:sehatak/core/widget/Custom_button.dart';

class IntroductionScreenService extends StatelessWidget {
  const IntroductionScreenService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 71.h,
                  left: 35.w,
                  child: const CustomArrowIcon(
                    colorArrowIcon: Color(0xffE2F163),
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Consistency Is\n the Key To progress.\n Don\'t Give Up!',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: usedColor.withOpacity(0.6),
                  height: 1.h,
                ),
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          CustomButtom(
              text: 'Next',
              onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeProviderView);
              }),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
