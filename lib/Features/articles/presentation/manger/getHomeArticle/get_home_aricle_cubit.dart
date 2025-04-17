import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';

part 'get_home_aricle_state.dart';

class GetHomeAricleCubit extends Cubit<GetHomeAricleState> {
  final ArticleRepo articleRepo;

  GetHomeAricleCubit(this.articleRepo) : super(GetHomeAricleInitial());
  Future<void> getHomeArticles() async {
    emit(GetHomeAricleLoading());
    final result = await articleRepo.getHomeArticle();

    result.fold(
      (failure) => emit(GetHomeAricleFailure(failure.errorMessage)),
      (getarticle) => emit(GetHomeAricleSuccess(getarticle)),
    );
  }
}
