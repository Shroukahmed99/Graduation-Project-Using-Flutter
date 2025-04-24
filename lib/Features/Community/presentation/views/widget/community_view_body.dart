import 'package:flutter/material.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/create_post.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBarHome(
          title: 'Community',
        ),
        CreatePost(),
      ],
    );
  }
}
