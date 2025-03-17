import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class CustomAppBarJob extends StatelessWidget {
  const CustomAppBarJob({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 24, left: 24),
      child: Row(
        children: [
          const CustomArrowIcon(),
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: accentColor,
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: accentColor,
              Icons.notifications,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
