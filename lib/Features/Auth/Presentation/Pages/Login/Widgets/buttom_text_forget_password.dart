import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class ButtomTextForgetPassword extends StatelessWidget {
  const ButtomTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
