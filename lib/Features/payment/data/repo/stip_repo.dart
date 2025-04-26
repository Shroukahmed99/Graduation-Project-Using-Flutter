import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/payment/data/models/payment_models.dart';
import 'package:sehatak/core/error/failure.dart';

/// Abstract Stripe Repository
abstract class StripeRepo {
  /// Creates a new Stripe checkout session.
  Future<Either<Failure, CheckoutSession>> createStripeSession(
    String id, {
    required String goal,
    required String duration,
    required String price,
  });
}
