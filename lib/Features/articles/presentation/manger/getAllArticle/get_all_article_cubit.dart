import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/articles/data/models/get_all_article_model.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';

part 'get_all_article_state.dart';

class GetAllArticleCubit extends Cubit<GetAllArticleState> {
  final ArticleRepo articleRepo;
  GetAllArticleCubit(this.articleRepo) : super(GetAllArticleInitial());
  Future<void> getAllArticles() async {
    emit(GetAllArticleLoading());
    final result = await articleRepo.getAllArticle();

    result.fold(
      (failure) => emit(GetAllArticleFailure(failure.errorMessage)),
      (allArticle) => emit(GetAllArticleSuccess(allArticle)),
    );
  }
}
