part of 'get_article_by_id_cubit.dart';

@immutable
sealed class GetArticleByIdState {}

final class GetArticleByIdInitial extends GetArticleByIdState {}

final class GetArticleByIdLoading extends GetArticleByIdState {}

final class GetArticleByIdSuccess extends GetArticleByIdState {
  final GetArticleId article;

  GetArticleByIdSuccess(this.article);
}

final class GetArticleByIdFailure extends GetArticleByIdState {
  final String message;

  GetArticleByIdFailure(this.message);
}
