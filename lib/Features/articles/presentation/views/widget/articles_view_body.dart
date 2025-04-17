import 'package:flutter/material.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/article_input_card.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_list_view.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';
import 'package:sehatak/const.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomAppBarHome(title: 'Articles'),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                ' Articls',
                style: TextStyle(color: accentColor, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 15),
          ArticleInputCard(),
          SizedBox(height: 25),
          Text(
            'Your Articls',
            style: TextStyle(color: accentColor, fontSize: 20),
          ),
          SizedBox(height: 25),
          ArticlesListView(),
        ],
      ),
    );
  }
}
