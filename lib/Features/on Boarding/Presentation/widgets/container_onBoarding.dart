import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_text_in_container.dart';
import 'package:sehatak/const.dart';

class ContainerOnboarding extends StatelessWidget {
  const ContainerOnboarding(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2});

  final String icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          height: 169,
          width: double.infinity,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  icon,
                  width: 40.51,
                  height: 42.7,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextInContainer(
                  text: text1,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextInContainer(
                  text: text2,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
