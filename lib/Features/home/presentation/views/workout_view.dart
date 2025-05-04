import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/workout/workout_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/workout_view_body.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoachCubit(HomeRepoImpl(ApiService(Dio())))..fetchCoaches(),
      child: const Scaffold(
        body: WorkoutViewBody(),
        bottomNavigationBar: CustomBottomNavigationHomeClient(),
      ),
    );
  }
}
