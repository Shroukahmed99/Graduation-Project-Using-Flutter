import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/home%20service/data/models/booking_response.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_model.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_new_model.dart';
import 'package:sehatak/Features/home%20service/data/repo/home_service_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class HomeServiceRepoImpl implements HomeServiceRepo {
  final ApiService apiService;

  HomeServiceRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookingResponse>> bokingById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PaymentData>>> fetchCustemr() async {
    try {
      final data = await apiService.get(
        endpoint: 'bookings/getAcceptedBookingsForServiceProvider',
      );

      if (data["status"] == "success") {
        final response = NewCustomerResponse.fromJson(data);
        return Right(response.data);
      } else {
        return Left(ServerFailure(data["message"] ?? "Unexpected error"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClientData>>> fetchNewCustemr() async {
    try {
      final data = await apiService.get(
        endpoint: 'bookings/getMyNewBookings',
      );

      if (data["status"] == "success") {
        final response = ClientDataResponse.fromJson(data);
        return Right(response.data);
      } else {
        return Left(ServerFailure(data["message"] ?? "Unexpected error"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
