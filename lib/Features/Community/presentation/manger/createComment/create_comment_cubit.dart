import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/Community/data/models/create_comment.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo.dart';

part 'create_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  final CommunityRepo communityRepo;
  final TextEditingController commentController = TextEditingController();

  AddCommentCubit(this.communityRepo) : super(AddCommentInitial());

  Future<void> addComment(String postId) async {
    final content = commentController.text.trim();
    if (content.isEmpty) return;

    emit(AddCommentLoading());

    final result =
        await communityRepo.addComment(postId: postId, content: content);

    result.fold(
      (failure) => emit(AddCommentFailure(failure.errorMessage)),
      (commentResponse) {
        commentController.clear();
        emit(AddCommentSuccess(commentResponse));
      },
    );
  }
}
