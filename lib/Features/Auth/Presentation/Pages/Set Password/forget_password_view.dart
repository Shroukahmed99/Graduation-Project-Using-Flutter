import 'package:flutter/material.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Set%20Password/widgets/Set_password_view_body.dart';
import 'package:sehatak/const.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: backgroundColor, // Light beige background
        body: SetPasswordViewBody());
  }
}
