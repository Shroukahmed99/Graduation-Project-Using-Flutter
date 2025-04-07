import 'package:bloc/bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';
import 'package:sehatak/Features/home/presentation/manger/nutrition%20more/nutrition_more_state.dart';

class NutritionMoreCubit extends Cubit<NutritionMoreState> {
  final HomeRepo homeRepo;

  NutritionMoreCubit(this.homeRepo) : super(NutritionMoreInitial());

  Future<void> fetchNutritionistById(String id) async {
    emit(NutritionMoreLoading());
    final failureOrSuccess = await homeRepo.fetchNutritionistById(id);
    failureOrSuccess.fold(
      (failure) => emit(NutritionMoreError(failure.toString())),
      (nutritionist) => emit(NutritionMoreLoaded(nutritionist)),
    );
  }
}
