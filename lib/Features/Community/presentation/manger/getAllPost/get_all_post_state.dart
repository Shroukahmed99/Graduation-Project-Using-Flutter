part of 'get_all_post_cubit.dart';

@immutable
sealed class GetAllPostState {}

final class GetAllPostInitial extends GetAllPostState {}

final class GetAllPostLoading extends GetAllPostState {}

final class GetAllPostSuccess extends GetAllPostState {
  final List<GetCommunity> post;

  GetAllPostSuccess(this.post);
}

final class GetAllPostFailure extends GetAllPostState {
  final String message;

  GetAllPostFailure(this.message);
}
