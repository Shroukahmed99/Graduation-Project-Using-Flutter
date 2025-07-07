import 'package:sehatak/Features/Ai/data/models/workout_recommendation.dart';

abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoading extends WorkoutState {}

class WorkoutSuccess extends WorkoutState {
  final List<WorkoutRecommendation> workouts;

  WorkoutSuccess(this.workouts);
}

class WorkoutFailure extends WorkoutState {
  final String error;

  WorkoutFailure(this.error);
}
