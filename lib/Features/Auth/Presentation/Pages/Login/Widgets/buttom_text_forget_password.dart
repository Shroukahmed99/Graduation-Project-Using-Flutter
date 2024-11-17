import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/ForgetPassword/forget_password_view.dart';
import 'package:sehatak/const.dart';

class ButtomTextForgetPassword extends StatelessWidget {
  const ButtomTextForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgetPasswordView()),
          );
        },
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
