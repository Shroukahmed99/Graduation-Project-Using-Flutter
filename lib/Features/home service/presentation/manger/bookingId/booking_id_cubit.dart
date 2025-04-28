import 'package:bloc/bloc.dart';
import 'package:sehatak/Features/home%20service/data/repo/home_service_repo_impl.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/bookingId/booking_id_state.dart';

class BookingIdCubit extends Cubit<BookingIdState> {
  final HomeServiceRepoImpl homeServiceRepoImpl;

  BookingIdCubit(this.homeServiceRepoImpl) : super(BookingIdInitial());

  Future<void> respondToBooking({
    required String id,
    required String status,
  }) async {
    if (isClosed) return; // تأكد أن الكيوبت مش متقفل قبل الـ emit
    emit(BookingIdLoading());

    final result = await homeServiceRepoImpl.bookingById(
      id: id,
      status: status,
    );

    result.fold(
      (failure) {
        if (!isClosed) emit(BookingIdFailure(failure.errorMessage));
      },
      (response) {
        if (!isClosed) emit(BookingIdSuccess(response));
      },
    );
  }
}
