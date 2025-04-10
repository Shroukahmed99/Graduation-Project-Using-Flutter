import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/Features/home/data/models/nutritions_model.dart';
import 'package:sehatak/Features/home/data/models/physical_model.dart';
import 'package:sehatak/Features/home/data/models/workout_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

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
        final response = NutritionistsResponse.fromJson(data);
        return Right(response.nutritionists);
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
  Future<Either<Failure, List<PhysicalTherapModel>>>
      fetchPhysicalTherap() async {
    try {
      final data = await apiService.get(
        endpoint: 'users/getAllPhysicalTherapists',
      );

      if (data['status'] == 'success') {
        final response = PhysicalTherapistsResponse.fromJson(data);
        return Right(response.physicalTherapists);
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
  Future<Either<Failure, List<CoachModel>>> fetchCoaches() async {
    try {
      final response = await apiService.get(endpoint: 'users/getAllCoaches');

      if (response['status'] == 'success') {
        final coachesResponse = CoachesResponse.fromJson(response);
        return Right(coachesResponse.coaches);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
