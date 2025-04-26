import 'package:sehatak/Features/payment/data/models/payment_models.dart';

/// Base class for Stripe Cubit states.
abstract class StripeState {}

/// Initial state of StripeCubit.
class StripeInitial extends StripeState {}

/// Loading state while creating a Stripe session.
class StripeLoading extends StripeState {}

/// Success state containing the CheckoutSession data.
class StripeSuccess extends StripeState {
  final CheckoutSession checkoutSession;

  StripeSuccess(this.checkoutSession);
}

/// Failure state containing an error message.
class StripeFailure extends StripeState {
  final String errorMessage;

  StripeFailure(this.errorMessage);
}
