// custom_loading_indicator.dart
import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
    );
  }
}