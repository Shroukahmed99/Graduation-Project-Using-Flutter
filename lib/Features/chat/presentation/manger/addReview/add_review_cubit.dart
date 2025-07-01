import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/Features/chat/presentation/manger/addReview/add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final ChatRepo chatRepo;

  AddReviewCubit(this.chatRepo) : super(AddReviewInitial());

  Future<void> submitReview({
    required String comment,
    required int rating,
    required String serviceProviderId,
  }) async {
    emit(AddReviewLoading());

    print('📤 Submitting review...');
    print('Comment: $comment, Rating: $rating, Provider: $serviceProviderId');

    final result = await chatRepo.addReview(
      comment: comment,
      rating: rating,
      serviceProviderId: serviceProviderId,
    );

    result.fold(
      (failure) {
        print('❌ Failed to submit review: ${failure.errorMessage}');
        if (!isClosed) emit(AddReviewFailure(failure.errorMessage));
      },
      (review) {
        if (!isClosed) emit(AddReviewSuccess(review));
      },
    );
  }
}
