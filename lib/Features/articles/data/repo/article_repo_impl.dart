import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sehatak/Features/articles/data/models/add_article_model.dart';
import 'package:sehatak/Features/articles/data/models/get_all_article_model.dart';
import 'package:sehatak/Features/articles/data/models/get_article_home.dart';
import 'package:sehatak/Features/articles/data/models/get_article_id.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class ArticleRepoImpl implements ArticleRepo {
  final ApiService apiService;

  ArticleRepoImpl(this.apiService);

  @override
  @override
  Future<Either<Failure, AddArticleModel>> addArticle({
    required String title,
    required String content,
    required String serviceProviderId,
    File? image,
  }) async {
    try {
      MultipartFile? multipartFile;
      if (image != null && image.existsSync()) {
        String mimeType = getMimeType(image.path);
        multipartFile = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType:
              MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
        );
      }

      FormData formData = FormData.fromMap({
        'title': title,
        'content': content,
        'serviceproviderId': serviceProviderId,
        if (multipartFile != null) 'img': multipartFile,
      });

      final response = await apiService.post(
        endpoint: 'articles/addArticle',
        data: formData,
      );

      if (response['status'] == 'success') {
        if (response['data'] != null && response['data'] is Map) {
          return Right(AddArticleModel.fromJson(response['data']['article']));
        } else {
          return Left(ServerFailure('Data is not in the expected format.'));
        }
      } else {
        return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetAllArticleModel>>> getAllArticle() async {
    try {
      final response = await apiService.get(endpoint: 'articles/getallarticle');

      if (response['status'] == 'success') {
        final articlesResponse = ArticlesResponse.fromJson(response);
        return Right(articlesResponse.articles);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetArticleId>> getArticleById(String id) async {
    try {
      final data = await apiService.get(
        endpoint: 'articles/getarticle/$id',
      );

      if (data["status"] == "success") {
        final articleJson = data['data']['article'];
        final article = GetArticleId.fromJson(articleJson);
        return Right(article);
      } else {
        return Left(ServerFailure(data["message"] ?? "Unexpected error"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetArticleHome>>> getHomeArticle() async {
    try {
      final response = await apiService.get(
          endpoint: 'articles/getallarticle?fields=img,title');

      if (response['status'] == 'success') {
        final articleListResponse = ArticleListResponse.fromJson(response);
        return Right(articleListResponse.articles);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  String getMimeType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';
      default:
        return 'application/octet-stream';
    }
  }
}
