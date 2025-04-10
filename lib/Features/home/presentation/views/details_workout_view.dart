import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/coach%20more/coach_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/details_workout_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

class DetailsWorkoutView extends StatelessWidget {
  final String id;

  const DetailsWorkoutView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoachMoreCubit(HomeRepoImpl(ApiService(Dio())))..fetchCoachesById(id),
      child: Scaffold(
        body: DeteailsWorkoutViewBody(
          coachesId: id,
        ),
      ),
    );
  }
}
