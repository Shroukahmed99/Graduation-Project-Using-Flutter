import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/Profile%20User/data/models/review_model.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/Features/home/data/models/more_physical_model.dart';
import 'package:sehatak/Features/home/data/models/more_workout_model.dart';
import 'package:sehatak/Features/home/data/models/nutritions_model.dart';
import 'package:sehatak/Features/home/data/models/physical_model.dart';
import 'package:sehatak/Features/home/data/models/top_rating_model.dart';
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
        endpoint: 'users/getNutritionistById/$id',
      );

      if (data["status"] == "success") {
        final response = NutritionistResponse.fromJson(data);
        return Right(response.nutritionist);
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

  @override
  Future<Either<Failure, CoachMoreId>> fetchCoachesById(String id) async {
    try {
      final data = await apiService.get(
        endpoint: 'users/getCoachById/$id',
      );

      if (data["status"] == "success") {
        final response = CoachResponse.fromJson(data);
        return Right(response.coach);
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
  Future<Either<Failure, PhysicalTherapistMore>> fetchPhysicalistById(
      String id) async {
    try {
      final data = await apiService.get(
        endpoint: 'users/getPhysicalTherapyById/$id',
      );

      if (data["status"] == "success") {
        final response = PhysicalTherapyResponse.fromJson(data);
        return Right(response.physicalTherapist);
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
  Future<Either<Failure, List<TopProvider>>> topRaring() async {
    try {
      final response =
          await apiService.get(endpoint: 'reviews/topRatedServiceProviders');

      if (response['status'] == 'success') {
        final topProvidersResponse = TopProvidersResponse.fromJson(response);
        return Right(topProvidersResponse.data.topProviders);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


  Future<Either<Failure, List<ReviewModel>>> getAllReviews() async {
    try {
      final response = await apiService.get(endpoint: 'reviews/getallReviews');
      if (response['status'] == 'success') {
        List<dynamic> data = response['data']['reviews'];
        List<ReviewModel> reviews =
            data.map((e) => ReviewModel.fromJson(e)).toList();
        return Right(reviews);
      } else {
        return Left(ServerFailure(response['message'] ?? 'Error'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}


