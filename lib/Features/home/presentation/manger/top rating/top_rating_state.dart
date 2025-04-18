part of 'top_rating_cubit.dart';

@immutable
sealed class TopRatingState {}

final class TopRatingInitial extends TopRatingState {}

final class TopRatingLoding extends TopRatingState {}

final class TopRatingSuccess extends TopRatingState {
  final List<TopProvider> providers;

  TopRatingSuccess(this.providers);
}

final class TopRatingFailure extends TopRatingState {
  final String message;

  TopRatingFailure(this.message);
}
