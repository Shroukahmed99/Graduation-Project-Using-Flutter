import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'fitness_state.dart';

class FitnessCubit extends Cubit<FitnessState> {
  final ProfileRepository profileRepository;

  FitnessCubit({required this.profileRepository}) : super(FitnessInitial());

  Future<void> getAuthUrl() async {
    emit(FitnessLoading());

    final result = await profileRepository.getFitnessAuthUrl();

    result.fold(
      (failure) => emit(FitnessFailure(message: failure.errorMessage)),
      (url) => emit(FitnessLoaded(url: url)),
    );
  }

  Future<void> getFitnessData() async {
    emit(FitnessLoading());

    final result = await profileRepository.getFitnessData();
    result.fold(
      (failure) => emit(FitnessFailure(message: failure.errorMessage)),
      (data) {
        emit(FitnessDataLoaded(
          steps: data.steps,
          heartRate: data.heartRate,
          calories: data.calories,
          sleep: data.sleep,
        ));
      },
    );
  }

  Future<void> refreshFitnessData() async {
    emit(FitnessLoading());

    final result = await profileRepository.refreshFitnessData();
    result.fold(
      (failure) => emit(FitnessFailure(message: failure.errorMessage)),
      (data) {
        emit(FitnessDataLoaded(
          steps: data.steps,
          heartRate: data.heartRate,
          calories: data.calories,
          sleep: data.sleep,
        ));
      },
    );
  }
}
