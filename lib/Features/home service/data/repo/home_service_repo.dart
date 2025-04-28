import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/home%20service/data/models/booking_response.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_model.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_new_model.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class HomeServiceRepo {
  Future<Either<Failure, List<PaymentData>>> fetchCustemr();
  Future<Either<Failure, List<ClientData>>> fetchNewCustemr();
  Future<Either<Failure, BookingResponse>> bookingById({
    required String id,
    required String status,
  });
}
