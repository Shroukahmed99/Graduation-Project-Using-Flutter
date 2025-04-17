import 'package:flutter/material.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_view_body.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArticlesViewBody(),
      bottomNavigationBar: CustomBottomNavigationHomeProvider(),
    );
  }
}
