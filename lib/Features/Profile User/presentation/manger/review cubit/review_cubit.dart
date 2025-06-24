import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/review%20cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ProfileRepositoryImpl reviewRepository;

  ReviewCubit(this.reviewRepository) : super(ReviewInitial());

  void fetchReviews() async {
    emit(ReviewLoading());
    final result = await reviewRepository.getReviews();
    result.fold(
      (failure) => emit(ReviewFailure(failure.errorMessage)),
      (reviews) => emit(ReviewSuccess(reviews)),
    );
  }
}
