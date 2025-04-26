import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/payment/data/models/payment_models.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class StripeRepo {
  Future<Either<Failure, CheckoutSession>> createStripeSession(
    String id, {
    required String goal,
    required String duration,
    required String price,
  });
}
