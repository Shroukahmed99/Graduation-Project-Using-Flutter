import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo_impl.dart';
import 'package:sehatak/Features/Community/presentation/manger/AddPost/add_post_cubit.dart';
import 'package:sehatak/Features/Community/presentation/manger/getAllPost/get_all_post_cubit.dart';
import 'package:sehatak/Features/Community/presentation/manger/likePost/like_post_cubit.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/community_view_body.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(Dio());
    final communityRepo = CommunityRepoImpl(apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddPostCubit(communityRepo),
        ),
        BlocProvider(
          create: (context) => GetAllPostCubit(communityRepo)..getAllPost(),
        ),
        BlocProvider(
          create: (context) => LikePostCubit(communityRepo),
        ),
        BlocProvider(
          create: (context) =>
              SaveNameCubit(ProfileRepositoryImpl(ApiService(Dio())))
                ..fetchClientProfile(),
        ),
      ],
      child: const Scaffold(
        body: CommunityViewBody(),
        bottomNavigationBar: CustomBottomNavigationHomeClient(),
      ),
    );
  }
}
