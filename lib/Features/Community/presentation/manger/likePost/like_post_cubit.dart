import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo.dart';

part 'like_post_state.dart';

class LikePostCubit extends Cubit<LikePostState> {
  final CommunityRepo communityRepo;

  LikePostCubit(this.communityRepo) : super(LikePostInitial());

  Future<void> likePost(String postId) async {
    try {
      emit(LikePostLoading());
      final result = await communityRepo.likePost(postId);

      result.fold(
        (failure) => emit(LikePostFailure(failure.errorMessage)),
        (likeResponse) {
          emit(LikePostSuccess(
            postId: postId,
            updatedLikesCount: likeResponse.likesCount,
            isLiked: likeResponse.liked,
          ));
        },
      );
    } catch (e) {
      emit(LikePostFailure(e.toString()));
    }
  }
}
