import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/views/login_view.dart';
import 'package:sehatak/Features/Questions/Gender%20Selection/widgets/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
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
              height: 15,
            ),
            CircleImageTextWidget(
              images: [
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
              height: 15.h,
            ),
            CircleImageTextWidget(
              images: const [AssetImage('assets/images/running.png')],
              text: 'Client',
              isSelected: isClientSelected,
              onTap: () {
                setState(() {
                  isClientSelected = !isClientSelected;
                  if (isClientSelected) {
                    isPoviderSelected = false;
                  }
                });
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Countinue',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignupView);
              },
            ),
            CustomSizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
