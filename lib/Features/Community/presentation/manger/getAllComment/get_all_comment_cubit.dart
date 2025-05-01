import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/Community/data/models/get_all_comment.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo.dart';

part 'get_all_comment_state.dart';

class GetAllCommentCubit extends Cubit<GetAllCommentState> {
  final CommunityRepo communityRepo;

  GetAllCommentCubit(this.communityRepo) : super(GetAllCommentInitial());
  Future<void> getAllComment(String postId) async {
    emit(GetAllCommentLoading());
    final result = await communityRepo.getAllComment(postId);

    result.fold(
      (failure) => emit(GetAllCommentFailure(failure.errorMessage)),
      (post) => emit(GetAllCommentSuccess(post)),
    );
  }
}
