import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/Features/home/data/models/nutritions_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, NutritionistMore>> fetchNutritionistById(
      String id) async {
    try {
      final data = await apiService.get(
        endpoint: 'users/getNutritionistById/$id', // استخدام الـ id الممرر
      );

      if (data["status"] == "success") {
        var nutritionistJson = data["data"]["Nutritionist"];
        NutritionistMore nutritionist =
            NutritionistMore.fromJson(nutritionistJson);
        return Right(nutritionist);
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
  Future<Either<Failure, List<NutritionModel>>> fetchNutritions() async {
    try {
      final data = await apiService.get(
        endpoint: 'users/getAllNutritionists',
      );

      if (data["status"] == "success") {
        var nutritionistsJson = data["data"]["Nutritionists"] as List;
        List<NutritionModel> nutritionists = nutritionistsJson
            .map((json) => NutritionModel.fromJson(json))
            .toList();

        return Right(nutritionists);
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
}
