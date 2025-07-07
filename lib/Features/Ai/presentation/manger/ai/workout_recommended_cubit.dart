import 'package:bloc/bloc.dart';
import 'package:sehatak/Features/Ai/data/repo/workout_ai_repo.dart';
import 'package:sehatak/Features/Ai/presentation/manger/ai/workout_recommended_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutRepo repository;

  WorkoutCubit(this.repository) : super(WorkoutInitial());

  Future<void> getRecommendations() async {
    print("WorkoutCubit: fetching recommendations...");
    emit(WorkoutLoading());

    final result = await repository.fetchRecommendations();

    result.fold(
      (failure) {
        print("WorkoutCubit: failed with error → ${failure.errorMessage}");
        emit(WorkoutFailure(failure.errorMessage));
      },
      (workouts) {
        print("WorkoutCubit: success with ${workouts.length} workouts");
        emit(WorkoutSuccess(workouts));
      },
    );
  }
}
