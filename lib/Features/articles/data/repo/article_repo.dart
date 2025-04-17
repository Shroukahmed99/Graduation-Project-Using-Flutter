import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/articles/data/models/add_article_model.dart';
import 'package:sehatak/Features/articles/data/models/get_all_article_model.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';
import 'package:sehatak/Features/articles/data/models/get_article_id.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class ArticleRepo {
  Future<Either<Failure, AddArticleModel>> addArticle({
    required String title,
    required String content,
    required String serviceProviderId,
    File? image,
  });

  Future<Either<Failure, List<GetAllArticleModel>>> getAllArticle();

  Future<Either<Failure, List<GetArticleHome>>> getHomeArticle();

  Future<Either<Failure, GetArticleId>> getArticleById(String articleId);
}
