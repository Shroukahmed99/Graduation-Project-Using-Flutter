import 'package:flutter/material.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/community_view_body.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CommunityViewBody(),
      bottomNavigationBar: CustomBottomNavigationHomeClient(),
    );
  }
}
