import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/Get%20all%20reviews/get_all_reviews_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/nurtrition/nutrition_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/nutrition_view_body.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NutritionCubit(HomeRepoImpl(ApiService(Dio())))
            ..fetchNutritionists(),
        ),
        BlocProvider(
          create: (_) => GetAllReviewsCubit(HomeRepoImpl(ApiService(Dio())))
            ..fetchAllReviews(),
        ),
      ],
      child: const Scaffold(
        body: NutritionViewBody(),
        bottomNavigationBar: CustomBottomNavigationHomeClient(),
      ),
    );
  }
}
