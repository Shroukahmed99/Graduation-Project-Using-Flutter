part of 'workout_cubit.dart';

@immutable
sealed class CoachState {}

final class CoachInitial extends CoachState {}

final class CoachLoading extends CoachState {}

final class CoachSuccess extends CoachState {
  final List<CoachModel> coaches;

  CoachSuccess(this.coaches);
}

final class CoachFailure extends CoachState {
  final String message;

  CoachFailure(this.message);
}
