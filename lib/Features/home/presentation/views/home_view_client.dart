import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo_impl.dart';
import 'package:sehatak/Features/articles/presentation/manger/getHomeArticle/get_home_aricle_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/home_view_client_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart'; // Make sure you import this too

class HomeViewClient extends StatelessWidget {
  const HomeViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetHomeAricleCubit(ArticleRepoImpl(ApiService(Dio())))
            ..getHomeArticles(),
      child: const Scaffold(
        body: HomeViewClientBody(),
        bottomNavigationBar: CustomBottomNavigationHomeClient(),
      ),
    );
  }
}
