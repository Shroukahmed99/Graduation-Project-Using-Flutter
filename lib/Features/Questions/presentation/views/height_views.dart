import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/height%20cubit/height_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/height_views_body.dart';

class HeightViews extends StatelessWidget {
  const HeightViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeightCubit(),
      child: const Scaffold(
        body: HeightViewsBody(),
      ),
    );
  }
}
