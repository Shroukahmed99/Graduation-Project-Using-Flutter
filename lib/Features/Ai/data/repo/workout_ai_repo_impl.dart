import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Ai/data/models/workout_recommendation.dart';
import 'package:sehatak/Features/Ai/data/repo/workout_ai_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class WorkoutRepositoryImpl implements WorkoutRepo {
  final Dio dio;

  WorkoutRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, List<WorkoutRecommendation>>>
      fetchRecommendations() async {
    try {
      final gender = CacheHelper.getData(key: 'genderInt');
      final kneePain = CacheHelper.getData(key: 'kneePain');
      final backPain = CacheHelper.getData(key: 'backPain');
      final diabetes = CacheHelper.getData(key: 'diabetes');
      final heartDisease = CacheHelper.getData(key: 'heartDisease');
      final hypertension = CacheHelper.getData(key: 'hypertension');

      final response = await dio.get(
        'https://fitsync-ai-api.onrender.com/workout',
        queryParameters: {
          'Gender': gender,
          'Knee_pain': kneePain,
          'Back_pain': backPain,
          'Diabeties': diabetes,
          'Heart_Disease': heartDisease,
          'Hypertension': hypertension,
        },
      );

      List<WorkoutRecommendation> workouts = (response.data as List)
          .map((json) => WorkoutRecommendation.fromJson(json))
          .toList();

      return right(workouts);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
