abstract class FitnessState {}

class FitnessInitial extends FitnessState {}

class FitnessLoading extends FitnessState {}

class FitnessRefreshing extends FitnessState {} 

class FitnessLoaded extends FitnessState {
  final String url;
  FitnessLoaded({required this.url});
}

class FitnessDataLoaded extends FitnessState {
  final int steps;
  final int heartRate;
  final int calories;
  final int sleep;

  FitnessDataLoaded({
    required this.steps,
    required this.heartRate,
    required this.calories,
    required this.sleep,
  });
}

class FitnessFailure extends FitnessState {
  final String message;
  FitnessFailure({required this.message});
}
