import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_text_in_container.dart';
import 'package:sehatak/const.dart';

class ContainerOnboarding extends StatelessWidget {
  const ContainerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 169,
        width: double.infinity,
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Vector.png',
                width: 40.51,
                height: 42.7,
              ),
              const CustomTextInContainer(
                text: 'Start your journey towards a ',
              ),
              const CustomTextInContainer(
                text: 'more active lifestyle',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
