import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/Features/home/data/models/more_physical_model.dart';
import 'package:sehatak/Features/home/data/models/more_workout_model.dart';
import 'package:sehatak/Features/home/data/models/nutritions_model.dart';
import 'package:sehatak/Features/home/data/models/physical_model.dart';
import 'package:sehatak/Features/home/data/models/top_rating_model.dart';
import 'package:sehatak/Features/home/data/models/workout_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NutritionModel>>> fetchNutritions();
  Future<Either<Failure, NutritionistMore>> fetchNutritionistById(String id);
  Future<Either<Failure, List<PhysicalTherapModel>>> fetchPhysicalTherap();
  Future<Either<Failure, List<CoachModel>>> fetchCoaches();
  Future<Either<Failure, CoachMoreId>> fetchCoachesById(String id);
  Future<Either<Failure, PhysicalTherapistMore>> fetchPhysicalistById(
      String id);
  Future<Either<Failure, List<TopProvider>>> topRaring();
}
