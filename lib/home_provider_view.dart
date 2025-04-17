import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class HomeProviderView extends StatelessWidget {
  const HomeProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationHomeProvider(),
    );
  }
}
