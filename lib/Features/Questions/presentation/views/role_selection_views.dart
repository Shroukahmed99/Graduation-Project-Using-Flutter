import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class RoleSelectionViews extends StatefulWidget {
  const RoleSelectionViews({super.key});

  @override
  _RoleSelectionViewsState createState() => _RoleSelectionViewsState();
}

class _RoleSelectionViewsState extends State<RoleSelectionViews> {
  bool isPoviderSelected = false;
  bool isClientSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 24.w,
        ),
        child: Column(
          children: [
            const CustomArrowBack(text: 'Back'),
            CustomSizedBox(
              height: 25.h,
            ),
            const CustomQuestionAndAswer(
              question: 'What’s Your Role',
              answer:
                  'A service provider can be a Nutritionist, Physiotherapist, or Gym Coach',
            ),
            const CustomSizedBox(
              height: 62,
            ),
            CircleImageTextWidget(
              images: const [
                AssetImage('assets/images/22.png'),
                AssetImage('assets/images/apple.png'),
                AssetImage('assets/images/medical.png'),
              ],
              text: 'Service Provider',
              isSelected: isPoviderSelected,
              onTap: () {
                setState(() {
                  isPoviderSelected = !isPoviderSelected;
                  if (isPoviderSelected) {
                    isClientSelected = false;
                  }
                });
              },
            ),
            CustomSizedBox(
              height: 48.h,
            ),
            CircleImageTextWidget(
              images: const [AssetImage('assets/images/running.png')],
              text: 'Client',
              isSelected: isClientSelected,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignupView);
                setState(() {
                  isClientSelected = !isClientSelected;
                  if (isClientSelected) {
                    isPoviderSelected = false;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
