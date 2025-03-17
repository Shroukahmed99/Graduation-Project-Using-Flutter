import 'package:flutter/material.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/information_nutrition.dart';

class NutritionListView extends StatelessWidget {
  const NutritionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const InformationNutrition();
      },
    );
  }
}
