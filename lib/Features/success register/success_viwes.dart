import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/core/utils/app_router.dart';

class SuccessViews extends StatelessWidget {
  const SuccessViews({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToOnBoarding(context);
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Vector.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: const Text(
                  'Registered Successfully!\nEnjoy the Application 😄',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void goToOnBoarding(BuildContext context) {
  Future.delayed(const Duration(seconds: 3), () {
    GoRouter.of(context).push(AppRouter.kIntroductionScreen);
  });
}
