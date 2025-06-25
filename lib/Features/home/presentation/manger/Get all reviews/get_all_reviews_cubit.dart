import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';
import 'package:sehatak/Features/home/presentation/manger/Get%20all%20reviews/get_all_reviews_state.dart';

class GetAllReviewsCubit extends Cubit<GetAllReviewsState> {
  final HomeRepo homeRepo;

  GetAllReviewsCubit(this.homeRepo) : super(GetAllReviewsInitial());

  void fetchAllReviews() async {
    emit(GetAllReviewsLoading());
    final result = await homeRepo.getAllReviews();
    result.fold(
      (failure) => emit(GetAllReviewsFailure(failure.errorMessage)),
      (reviews) => emit(GetAllReviewsSuccess(reviews)),
    );
  }
}