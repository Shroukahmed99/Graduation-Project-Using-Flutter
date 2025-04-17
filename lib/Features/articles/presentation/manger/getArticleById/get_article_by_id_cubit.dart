import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/articles/data/models/get_article_id.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';
import 'package:sehatak/core/error/failure.dart';

part 'get_article_by_id_state.dart';

class GetArticleByIdCubit extends Cubit<GetArticleByIdState> {
  final ArticleRepo articleRepo;

  GetArticleByIdCubit(this.articleRepo) : super(GetArticleByIdInitial());

  Future<void> getArticleById(String id) async {
    try {
      emit(GetArticleByIdLoading());
      final failureOrSuccess = await articleRepo.getArticleById(id);
      failureOrSuccess.fold(
        (failure) => emit(GetArticleByIdFailure(_mapFailureToMessage(failure))),
        (article) => emit(GetArticleByIdSuccess(article)),
      );
    } catch (e) {
      emit(GetArticleByIdFailure('Error: $e'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.errorMessage;
    } else {
      return "Unexpected error occurred";
    }
  }
}
