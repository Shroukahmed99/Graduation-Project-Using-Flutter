import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/login_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_indicator.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_page_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_skip_icon.dart';
import 'package:sehatak/core/widget/custom_General_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentIndex = 0;
  final List<String> buttonTexts = [
    "Next",
    "Next",
    "Get Started",
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {
          currentIndex = pageController.page!.round();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          controller: pageController,
          onPageChanged: (index) {},
        ),
        CustomIndicator(dotsIndex: currentIndex),
        const CustomSkipIcon(),
        CustomGeneralButton(
          text: buttonTexts[currentIndex],
          onTap: () {
            if (currentIndex < buttonTexts.length - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            }
          },
        ),
      ],
    );
  }
}
