part of 'goal_cubit.dart';

abstract class GoalState {}

class GoalInitial extends GoalState {}

class GoalSelected extends GoalState {
  final String goal;
  GoalSelected(this.goal);
}
