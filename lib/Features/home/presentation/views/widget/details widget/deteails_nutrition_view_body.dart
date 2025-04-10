import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/manger/nutrition%20more/nutrition_more_state.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_nutrition.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section.dart';
import 'package:sehatak/Features/home/presentation/manger/nutrition%20more/nutrition_more_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class DeteailsNutritionViewBody extends StatelessWidget {
  final String nutritionId;

  const DeteailsNutritionViewBody({super.key, required this.nutritionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionMoreCubit, NutritionMoreState>(
      builder: (context, state) {
        if (state is NutritionMoreLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NutritionMoreSuccess) {
          final nutritionist = state.nutritionistMore;

          return Column(
            children: [
              const CustomAppBarDetails(
                title: 'Nutrition',
                image: 'assets/images/category2.png',
              ),
              const SizedBox(height: 20),
              InfoDataNutrition(
                nutritionistMore: nutritionist,
              ),
              const FeedbackSection(),
              const SizedBox(height: 40),
              const CustomButtomBookNow(text: 'BOOK NOW')
            ],
          );
        } else if (state is NutritionMoreFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else {
          return const Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
