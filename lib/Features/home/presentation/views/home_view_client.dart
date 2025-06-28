import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo_impl.dart';
import 'package:sehatak/Features/articles/presentation/manger/getHomeArticle/get_home_aricle_cubit.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/top%20rating/top_rating_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/home_view_client_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class HomeViewClient extends StatelessWidget {
  const HomeViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetHomeAricleCubit(ArticleRepoImpl(ApiService(Dio())))
                ..getHomeArticles(),
        ),
        BlocProvider(
          create: (context) =>
              TopRatingCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchTopProviders(),
        ),
        BlocProvider(
          create: (context) =>
              SaveNameCubit(ProfileRepositoryImpl(ApiService(Dio())))
                ..fetchClientProfile(),
        ),
      ],
      child:const Scaffold(
        body:  SafeArea(
          bottom: false, // نسيب المساحة لتحت للـ bottom nav
          child: HomeViewClientBody(),
        ),
        bottomNavigationBar: SafeArea(
          top: false, // مانزودش مساحة فوق للبار
          child: CustomBottomNavigationHomeClient(),
        ),
      ),
    );
  }
}
