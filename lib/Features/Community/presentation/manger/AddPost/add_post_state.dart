part of 'add_post_cubit.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class AddPostmagePicked extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostSuccess extends AddPostState {
  final NewCommunity post;

  AddPostSuccess(this.post);
}

final class AddPostFailure extends AddPostState {
  final String message;

  AddPostFailure(this.message);
}
