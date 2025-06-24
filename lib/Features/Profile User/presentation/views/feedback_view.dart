import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20feedbace/feedback_body.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewCubit(
        ProfileRepositoryImpl(ApiService(Dio())),
      )..fetchReviews(),
      child: const Scaffold(
        backgroundColor: backgroundColor,
        body: FeedbackBody(),
        bottomNavigationBar: CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}