import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_indicator.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_text_in_container.dart';
import 'package:sehatak/const.dart';

class ContainerOnboarding extends StatelessWidget {
  const ContainerOnboarding({super.key, required this.dotsIndicator});
  final int? dotsIndicator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 169,
        width: double.infinity,
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Vector.png',
                width: 40.51,
                height: 42.7,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextInContainer(
                text: 'Start your journey towards a ',
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomTextInContainer(
                text: 'more active lifestyle',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomIndicator(dotsIndex: dotsIndicator),
            ],
          ),
        ),
      ),
    );
  }
}
