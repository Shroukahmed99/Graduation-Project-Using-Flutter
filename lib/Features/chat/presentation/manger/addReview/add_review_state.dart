import 'package:sehatak/Features/chat/data/models/add_review.dart';

abstract class AddReviewState {}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {
  final ReviewData review;

  AddReviewSuccess(this.review);
}

class AddReviewFailure extends AddReviewState {
  final String errorMessage;

  AddReviewFailure(this.errorMessage);
}
