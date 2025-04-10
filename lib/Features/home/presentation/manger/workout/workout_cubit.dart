import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home/data/models/workout_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';

part 'workout_state.dart';

class CoachCubit extends Cubit<CoachState> {
  final HomeRepo homeRepo;
  CoachCubit(this.homeRepo) : super(CoachInitial());
  Future<void> fetchCoaches() async {
    emit(CoachLoading());
    final result = await homeRepo.fetchCoaches();

    result.fold(
      (failure) => emit(CoachFailure(failure.errorMessage)),
      (coaches) => emit(CoachSuccess(coaches)),
    );
  }
}
