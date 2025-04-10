import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';

abstract class NutritionMoreState {
  const NutritionMoreState();
}

class NutritionMoreInitial extends NutritionMoreState {}

class NutritionMoreLoading extends NutritionMoreState {}

class NutritionMoreSuccess extends NutritionMoreState {
  final NutritionistMore nutritionistMore;

  const NutritionMoreSuccess(this.nutritionistMore);
}

class NutritionMoreFailure extends NutritionMoreState {
  final String message;

  const NutritionMoreFailure(this.message);
}
