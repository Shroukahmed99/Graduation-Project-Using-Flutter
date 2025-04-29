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
      // Printing the request data being sent
      print('Requesting Stripe session with ID: $id');
      print('Goal: $goal, Duration: $duration, Price: $price');

      final Map<String, dynamic> response = await apiService.post(
        endpoint: 'bookings/checkout-session/$id',
        data: {
          'goal': goal,
          'duration': duration,
          'price': price,
        },
      );

      print('Response received: $response');

      if (response['status'] == 'success' && response['session'] != null) {
        final session = CheckoutSession.fromJson(response['session']);
        print('Stripe session created successfully: ${session.id}');
        return Right(session);
      } else {
        final errorMessage = response['message'] ?? 'Unknown error';
        print('Error from server: $errorMessage');
        return Left(ServerFailure(errorMessage));
      }
    } on DioException catch (e) {
      print('Dio exception occurred: ${e.message}');
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print('Unexpected error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
