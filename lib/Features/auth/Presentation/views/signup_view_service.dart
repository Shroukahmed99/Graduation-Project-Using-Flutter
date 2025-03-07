import 'package:flutter/material.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/signup_view_service_body.dart';

class SignupViewService extends StatelessWidget {
  const SignupViewService({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupViewServiceBody(),
    );
  }
}
