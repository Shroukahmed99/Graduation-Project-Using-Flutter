import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/success%20register/success_viwes_body.dart';
import 'package:sehatak/core/utils/app_router.dart';

class SetPasswordSuccess extends StatelessWidget {
  const SetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessViewBody(
        text: ' Password Changed!✅',
        onNavigate: () {
          GoRouter.of(context).push(AppRouter.kLoginView);
        },
      ),
    );
  }
}
