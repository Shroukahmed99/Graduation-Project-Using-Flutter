import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/container_onBoarding.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_page_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_skip_icon.dart';
import 'package:sehatak/core/widget/custom_General_button.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomPageView(),
        CustomSkipIcon(),
        ContainerOnboarding(),
        CustomGeneralButton(),
      ],
    );
  }
}
