import 'package:sehatak/Features/home/data/models/nutritions_model.dart';

abstract class NutritionState {}

class NutritionInitial extends NutritionState {}

class NutritionLoading extends NutritionState {}

class NutritionSuccess extends NutritionState {
  final List<NutritionModel> nutritionists;

  NutritionSuccess(this.nutritionists);
}

class NutritionFailure extends NutritionState {
  final String message;

  NutritionFailure(this.message);
}
