import 'package:flutter/material.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/signup_view_client_body.dart';

class SignupViewClient extends StatelessWidget {
  const SignupViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupViewClientBody(),
    );
  }
}
