part of 'create_comment_cubit.dart';

@immutable
sealed class AddCommentState {}

final class AddCommentInitial extends AddCommentState {}

final class AddCommentLoading extends AddCommentState {}

final class AddCommentSuccess extends AddCommentState {
  final AddCommentResponse response;

  AddCommentSuccess(this.response);
}

final class AddCommentFailure extends AddCommentState {
  final String message;

  AddCommentFailure(this.message);
}
