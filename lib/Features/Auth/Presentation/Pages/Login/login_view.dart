import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/Widgets/login_view_body.dart';
import 'package:sehatak/const.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor, // Light beige background
        body: LoginViewBody());
  }
}
