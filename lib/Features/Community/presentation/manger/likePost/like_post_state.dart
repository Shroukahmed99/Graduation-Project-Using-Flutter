part of 'like_post_cubit.dart';

@immutable
sealed class LikePostState {}

final class LikePostInitial extends LikePostState {}

class LikePostLoading extends LikePostState {}

class LikePostSuccess extends LikePostState {
  final String postId;
  final int updatedLikesCount;
  final bool isLiked;

  LikePostSuccess({
    required this.postId,
    required this.updatedLikesCount,
    required this.isLiked,
  });
}

class LikePostFailure extends LikePostState {
  final String message;

  LikePostFailure(this.message);
}
