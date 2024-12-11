import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child:  Text(
          'Forgot Password?',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
