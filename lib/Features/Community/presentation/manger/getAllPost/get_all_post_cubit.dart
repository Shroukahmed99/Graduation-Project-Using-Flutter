import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/Community/data/models/get_all_post.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo.dart';

part 'get_all_post_state.dart';

class GetAllPostCubit extends Cubit<GetAllPostState> {
  final CommunityRepo communityRepo;

  GetAllPostCubit(this.communityRepo) : super(GetAllPostInitial());
  Future<void> getAllPost() async {
    emit(GetAllPostLoading());
    final result = await communityRepo.getAllPost();

    result.fold(
      (failure) => emit(GetAllPostFailure(failure.errorMessage)),
      (post) => emit(GetAllPostSuccess(post)),
    );
  }
}
