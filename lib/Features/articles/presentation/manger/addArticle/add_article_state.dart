part of 'add_article_cubit.dart';

abstract class AddArticleState {}

class AddArticleInitial extends AddArticleState {}

class AddArticleImagePicked extends AddArticleState {}

class AddArticleLoading extends AddArticleState {}

class AddArticleSuccess extends AddArticleState {
  final AddArticleModel article;
  AddArticleSuccess(this.article);
}

class AddArticleFailure extends AddArticleState {
  final String message;
  AddArticleFailure(this.message);
}
