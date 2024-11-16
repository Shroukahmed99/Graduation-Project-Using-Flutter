import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/container_onBoarding.dart';
import 'package:sehatak/core/widget/background_image.dart';

class CustomViewPageItem extends StatelessWidget {
  const CustomViewPageItem(
      {super.key,
      required this.image,
      required this.icon,
      required this.text1,
      required this.text2});
  final String image;
  final String icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: image),
        ContainerOnboarding(
          icon: icon,
          text1: text1,
          text2: text2,
        )
      ],
    );
  }
}
