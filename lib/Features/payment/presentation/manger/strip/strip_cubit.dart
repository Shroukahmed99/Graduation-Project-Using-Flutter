import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/payment/data/repo/stip_repo.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_state.dart';

/// Cubit to manage Stripe session creation
class StripeCubit extends Cubit<StripeState> {
  final StripeRepo stripeRepo;

  StripeCubit(this.stripeRepo) : super(StripeInitial());

  /// Creates a new Stripe checkout session
  Future<void> createStripeSession(
    String id, {
    required String goal,
    required String duration,
    required String price,
  }) async {
    emit(StripeLoading());

    final result = await stripeRepo.createStripeSession(
      id,
      goal: goal,
      duration: duration,
      price: price,
    );

    result.fold(
      (failure) => emit(StripeFailure(failure.errorMessage)),
      (checkoutSession) => emit(StripeSuccess(checkoutSession)),
    );
  }
}
