import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomTextQuestion extends StatelessWidget {
  const CustomTextQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'League Spartan',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            height: 1.0,
            decoration: TextDecoration.none,
          ),
        ),
        TextButton(
          onPressed: () {
            // يمكنك إضافة الإجراء عند الضغط هنا
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: secondaryColor,
              fontFamily: 'League Spartan',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
