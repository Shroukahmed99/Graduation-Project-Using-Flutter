import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomSkipIcon extends StatelessWidget {
  const CustomSkipIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 65, left: 270),
      child: Row(
        children: [
          const Text(
            'Skip',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'LeagueSpartan',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 3),
          Image.asset(
            'assets/images/v.png',
            height: 11,
            width: 16,
          ),
        ],
      ),
    );
  }
}
