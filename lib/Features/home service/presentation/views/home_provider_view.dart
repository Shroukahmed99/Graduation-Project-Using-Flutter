import 'package:flutter/material.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/home_service_view_body.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class HomeProviderView extends StatelessWidget {
  const HomeProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeServiceViewBody(),
      bottomNavigationBar: CustomBottomNavigationHomeProvider(),
    );
  }
}
