import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/payment/data/repo/stip_repo.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_state.dart';

class StripeCubit extends Cubit<StripeState> {
  final StripeRepo stripeRepo;

  StripeCubit(this.stripeRepo) : super(StripeInitial());

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

  void selectPackage({
    required int selectedIndex,
    required String selectedPrice,
    required String selectedDuration,
  }) {
    emit(StripePackageSelected(
      selectedIndex: selectedIndex,
      selectedPrice: selectedPrice,
      selectedDuration: selectedDuration,
    ));
  }
}
