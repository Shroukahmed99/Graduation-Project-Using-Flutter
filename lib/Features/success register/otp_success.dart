import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/success%20register/success_viwes_body.dart';
import 'package:sehatak/core/utils/app_router.dart';

class OtpSuccess extends StatelessWidget {
  const OtpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessViewBody(
        text: 'Account Verified!🔓',
        onNavigate: () {
          GoRouter.of(context).push(AppRouter.kSetPasswordView);
        },
      ),
    );
  }
}
