import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/container_onBoarding.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_page_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_skip_icon.dart';
import 'package:sehatak/core/widget/custom_General_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          controller: pageController,
        ),
        const CustomSkipIcon(),
        ContainerOnboarding(
          dotsIndicator:
              pageController!.hasClients ? pageController?.page?.round() : 0,
        ),
        const CustomGeneralButton(),
      ],
    );
  }
}
