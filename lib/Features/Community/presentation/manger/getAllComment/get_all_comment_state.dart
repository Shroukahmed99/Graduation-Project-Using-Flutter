part of 'get_all_comment_cubit.dart';

@immutable
sealed class GetAllCommentState {}

final class GetAllCommentInitial extends GetAllCommentState {}

final class GetAllCommentLoading extends GetAllCommentState {}

final class GetAllCommentSuccess extends GetAllCommentState {
  final List<CommentAll> comment;

  GetAllCommentSuccess(this.comment);
}

final class GetAllCommentFailure extends GetAllCommentState {
  final String message;

  GetAllCommentFailure(this.message);
}
