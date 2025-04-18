import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home/data/models/top_rating_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';

part 'top_rating_state.dart';

class TopRatingCubit extends Cubit<TopRatingState> {
  final HomeRepo homeRepo;
  TopRatingCubit(this.homeRepo) : super(TopRatingInitial());
  Future<void> fetchTopProviders() async {
    emit(TopRatingLoding());
    final result = await homeRepo.topRaring();

    result.fold(
      (failure) => emit(TopRatingFailure(failure.errorMessage)),
      (providers) => emit(TopRatingSuccess(providers)),
    );
  }
}
