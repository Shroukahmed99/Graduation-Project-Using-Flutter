import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo_impl.dart';
import 'package:sehatak/Features/articles/presentation/manger/addArticle/add_article_cubit.dart';
import 'package:sehatak/Features/articles/presentation/manger/getAllArticle/get_all_article_cubit.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_view_body.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllArticleCubit(ArticleRepoImpl(ApiService(Dio())))
                ..getAllArticles(),
        ),
        BlocProvider(
          create: (context) =>
              AddArticleCubit(ArticleRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              SaveNameCubit(ProfileRepositoryImpl(ApiService(Dio())))
                ..fetchProviderProfile(),
        ),
      ],
      child: const Scaffold(
        body: ArticlesViewBody(),
        bottomNavigationBar: CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}
