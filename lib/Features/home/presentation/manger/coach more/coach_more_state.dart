part of 'coach_more_cubit.dart';

@immutable
sealed class CoachMoreState {}

final class CoachMoreInitial extends CoachMoreState {}

final class CoachMoreLoading extends CoachMoreState {}

final class CoachMoreSuccess extends CoachMoreState {
  final CoachMoreId coachMoreId;

  CoachMoreSuccess(this.coachMoreId);
}

final class CoachMoreFailuer extends CoachMoreState {
  final String message;

  CoachMoreFailuer(this.message);
}
