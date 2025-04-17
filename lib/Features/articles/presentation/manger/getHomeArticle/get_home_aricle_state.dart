part of 'get_home_aricle_cubit.dart';

@immutable
sealed class GetHomeAricleState {}

final class GetHomeAricleInitial extends GetHomeAricleState {}

final class GetHomeAricleLoading extends GetHomeAricleState {}

final class GetHomeAricleSuccess extends GetHomeAricleState {
  final List<GetArticleHome> getarticle;

  GetHomeAricleSuccess(this.getarticle);
}

final class GetHomeAricleFailure extends GetHomeAricleState {
  final String message;

  GetHomeAricleFailure(this.message);
}
