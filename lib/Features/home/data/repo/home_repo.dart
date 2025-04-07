import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/Features/home/data/models/nutritions_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NutritionModel>>> fetchNutritions();
  Future<Either<Failure, NutritionistMore>> fetchNutritionistById(String id);
}
