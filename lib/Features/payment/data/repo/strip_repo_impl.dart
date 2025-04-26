import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/payment/data/models/payment_models.dart';
import 'package:sehatak/Features/payment/data/repo/stip_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class StripeRepoImpl implements StripeRepo {
  final ApiService apiService;

  StripeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CheckoutSession>> createStripeSession(
    String id, {
    required String goal,
    required String duration,
    required String price,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: 'bookings/checkout-session/$id',
        data: {
          'goal': goal,
          'duration': duration,
          'price': price,
        },
      );
      if (response['status'] == 'success' && response['session'] != null) {
        final session = CheckoutSession.fromJson(response['session']);
        return Right(session);
      } else {
        final errorMessage = response['message'] ?? 'Unknown error';
        return Left(ServerFailure(errorMessage));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
