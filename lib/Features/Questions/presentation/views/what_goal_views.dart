import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/what%20goal%20cubit/goal_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/what_goal_views_body.dart';

class WhatGoalViews extends StatelessWidget {
  const WhatGoalViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit(),
      child: const Scaffold(
        body: WhatGoalViewsBody(),
      ),
    );
  }
}
