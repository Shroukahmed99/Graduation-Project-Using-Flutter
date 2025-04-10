import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home/data/models/more_workout_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';

part 'coach_more_state.dart';

class CoachMoreCubit extends Cubit<CoachMoreState> {
  final HomeRepo homeRepo;

  CoachMoreCubit(this.homeRepo) : super(CoachMoreInitial());
  Future<void> fetchCoachesById(String id) async {
    try {
      emit(CoachMoreLoading());
      final failureOrSuccess = await homeRepo.fetchCoachesById(id);
      failureOrSuccess.fold(
        (failure) => emit(CoachMoreFailuer(failure.toString())),
        (coachMoreId) => emit(CoachMoreSuccess(coachMoreId)),
      );
    } catch (e) {
      emit(CoachMoreFailuer('Error: $e'));
    }
  }
}
