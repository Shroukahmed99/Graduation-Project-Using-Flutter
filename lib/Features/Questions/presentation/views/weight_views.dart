import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/weight%20cubit/weight_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/weight_views_body.dart';

class WeightViews extends StatelessWidget {
  const WeightViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeightCubit(),
      child: const Scaffold(
        body: WeightViewsBody(),
      ),
    );
  }
}
