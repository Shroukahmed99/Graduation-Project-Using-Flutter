import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/nutrition%20more/nutrition_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/deteails_nutrition_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

class DetailsNutritionView extends StatelessWidget {
  final String id;

  const DetailsNutritionView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NutritionMoreCubit(HomeRepoImpl(ApiService(Dio())))
        ..fetchNutritionistById(id), // تمرير الـ id هنا
      child: Scaffold(
        body: DeteailsNutritionViewBody(nutritionId: id), // تمرير الـ id هنا
      ),
    );
  }
}
