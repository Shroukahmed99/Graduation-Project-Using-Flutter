import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';
import 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  final HomeRepo homeRepo;

  NutritionCubit(this.homeRepo) : super(NutritionInitial());

  Future<void> fetchNutritionists() async {
    emit(NutritionLoading());
    final result = await homeRepo.fetchNutritions();

    result.fold(
      (failure) => emit(NutritionFailure(failure.errorMessage)),
      (nutritionists) => emit(NutritionSuccess(nutritionists)),
    );
  }
}
