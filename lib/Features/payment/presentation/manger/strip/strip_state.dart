import 'package:sehatak/Features/payment/data/models/payment_models.dart';

abstract class StripeState {}

class StripeInitial extends StripeState {}

class StripeLoading extends StripeState {}

class StripeSuccess extends StripeState {
  final CheckoutSession checkoutSession;

  StripeSuccess(this.checkoutSession);
}

class StripeFailure extends StripeState {
  final String errorMessage;

  StripeFailure(this.errorMessage);
}

class StripePackageSelected extends StripeState {
  final int selectedIndex;
  final String selectedPrice;
  final String selectedDuration;

  StripePackageSelected({
    required this.selectedIndex,
    required this.selectedPrice,
    required this.selectedDuration,
  });
}
