import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/nurtrition/nutrition_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/nurtrition/nutrition_state.dart';
import 'package:sehatak/Features/home/presentation/views/widget/job%20widget/information_nutrition.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class NutritionListView extends StatelessWidget {
  const NutritionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        if (state is NutritionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NutritionFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else if (state is NutritionSuccess) {
          final nutritionists = state.nutritionists;
          return ListView.builder(
            itemCount: nutritionists.length,
            itemBuilder: (context, index) {
              final nutritionist = nutritionists[index];
              return InformationNutrition(nutrition: nutritionist);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
