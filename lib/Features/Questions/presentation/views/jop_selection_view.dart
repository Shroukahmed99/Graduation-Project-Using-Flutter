import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/job%20cubit/job_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/jop_selection_view_body.dart';

class JopSelectionView extends StatelessWidget {
  const JopSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(),
      child: const Scaffold(
        body: JopSelectionViewBody(),
      ),
    );
  }
}
