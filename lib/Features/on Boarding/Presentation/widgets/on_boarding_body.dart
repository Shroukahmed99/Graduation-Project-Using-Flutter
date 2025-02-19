import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/login_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_indicator.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_page_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_skip_icon.dart';
import 'package:sehatak/core/widget/custom_General_button.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key});

  final PageController pageController = PageController(initialPage: 0);
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  final List<String> buttonTexts = [
    "Next",
    "Next",
    "Get Started",
  ];

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      currentIndexNotifier.value = pageController.page!.round();
    });

    return Stack(
      children: [
        CustomPageView(
          controller: pageController,
          onPageChanged: (index) {},
        ),
        ValueListenableBuilder<int>(
          valueListenable: currentIndexNotifier,
          builder: (context, currentIndex, child) {
            return CustomIndicator(dotsIndex: currentIndex);
          },
        ),
        const CustomSkipIcon(),
        ValueListenableBuilder<int>(
          valueListenable: currentIndexNotifier,
          builder: (context, currentIndex, child) {
            return CustomGeneralButton(
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
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
