import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/home_view_client_body.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart'; // Make sure you import this too

class HomeViewClient extends StatelessWidget {
  const HomeViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewClientBody(),
      bottomNavigationBar: CustomBottomNavigationHomeClient(),
    );
  }
}
