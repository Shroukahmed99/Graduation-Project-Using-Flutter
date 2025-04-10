import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';

abstract class NutritionMoreState {
  const NutritionMoreState();
}

class NutritionMoreInitial extends NutritionMoreState {}

class NutritionMoreLoading extends NutritionMoreState {}

class NutritionMoreLoaded extends NutritionMoreState {
  final NutritionistMore nutritionistMore;

  const NutritionMoreLoaded(this.nutritionistMore);
}

class NutritionMoreError extends NutritionMoreState {
  final String message;

  const NutritionMoreError(this.message);
}
