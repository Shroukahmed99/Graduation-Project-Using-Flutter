import 'package:sehatak/Features/Profile%20User/data/models/review_model.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {
  final List<ReviewModel> reviews;
  ReviewSuccess(this.reviews);
}

class ReviewFailure extends ReviewState {
  final String error;
  ReviewFailure(this.error);
}