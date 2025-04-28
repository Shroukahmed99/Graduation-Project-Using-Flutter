import 'package:sehatak/Features/home%20service/data/models/booking_response.dart';

sealed class BookingIdState {}

final class BookingIdInitial extends BookingIdState {}

final class BookingIdLoading extends BookingIdState {}

final class BookingIdSuccess extends BookingIdState {
  final BookingResponse bookingResponse;

  BookingIdSuccess(this.bookingResponse);
}

final class BookingIdFailure extends BookingIdState {
  final String message;

  BookingIdFailure(this.message);
}
