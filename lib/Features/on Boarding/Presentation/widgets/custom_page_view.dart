import 'package:flutter/material.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/widgets/custom_view_page_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView(
      {super.key,
      required this.controller,
      required Null Function(dynamic index) onPageChanged});
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return PageView(controller: controller, children: const [
      CustomViewPageItem(
          image:
              'assets/images/1.png',
          icon: 'assets/images/Vector.png',
          text1: 'Start your journey towards a',
          text2: 'more active lifestyle'),
      CustomViewPageItem(
          image: 'assets/images/2.png',
          icon: 'assets/images/Vector (1).png',
          text1: 'Find nutrition tips that fit ',
          text2: 'your lifestyle'),
      CustomViewPageItem(
          image:
              'assets/images/3.png',
          icon: 'assets/images/Community.png',
          text1: 'A community for you, ',
          text2: 'challenge yourself')
    ]);
  }
}
