import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Ai/data/models/workout_recommendation.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class WorkoutRepo {
  Future<Either<Failure, List<WorkoutRecommendation>>> fetchRecommendations();
}
