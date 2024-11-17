import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Signup/widgets/signup_view_body.dart';
import 'package:sehatak/const.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor, // Light beige background
        body: SignupViewBody());
  }
}
