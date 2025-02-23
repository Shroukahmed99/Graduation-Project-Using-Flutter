import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/views/widgets/custom_indicator.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/views/widgets/custom_page_view.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/custom_skip_icon.dart';
import 'package:sehatak/core/widget/custom_General_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late final PageController pageController;
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  final List<String> buttonTexts = [
    "Next",
    "Next",
    "Get Started",
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      currentIndexNotifier.value = pageController.page!.round();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    currentIndexNotifier.dispose();
    super.dispose();
  }

  void navigateToLogin(BuildContext context) {
    GoRouter.of(context).push(AppRouter.kLoginView);
  }

  @override
  Widget build(BuildContext context) {
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
                  navigateToLogin(context); // ✅ استدعاء الدالة بعد آخر صفحة
                }
              },
            );
          },
        ),
      ],
    );
  }
}
