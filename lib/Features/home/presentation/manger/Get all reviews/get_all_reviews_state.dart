import 'package:sehatak/Features/Profile%20User/data/models/review_model.dart';

abstract class GetAllReviewsState {}

class GetAllReviewsInitial extends GetAllReviewsState {}

class GetAllReviewsLoading extends GetAllReviewsState {}

class GetAllReviewsSuccess extends GetAllReviewsState {
  final List<ReviewModel> reviews;
  GetAllReviewsSuccess(this.reviews);
}

class GetAllReviewsFailure extends GetAllReviewsState {
  final String error;
  GetAllReviewsFailure(this.error);
}