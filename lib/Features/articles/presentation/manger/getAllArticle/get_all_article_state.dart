part of 'get_all_article_cubit.dart';

@immutable
sealed class GetAllArticleState {}

final class GetAllArticleInitial extends GetAllArticleState {}

final class GetAllArticleLoading extends GetAllArticleState {}

final class GetAllArticleSuccess extends GetAllArticleState {
  final List<GetAllArticleModel> allArticle;

  GetAllArticleSuccess(this.allArticle);
}

final class GetAllArticleFailure extends GetAllArticleState {
  final String message;

  GetAllArticleFailure(this.message);
}
