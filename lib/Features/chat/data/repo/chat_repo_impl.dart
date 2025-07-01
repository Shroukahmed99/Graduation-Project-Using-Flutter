import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/chat/data/models/add_review.dart';
import 'package:sehatak/Features/chat/data/models/all_chat.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/api_service.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService apiService;

  ChatRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookingData>>> allChat() async {
    try {
      final data = await apiService.get(
        endpoint: 'bookings/getAcceptedBookingsForClient',
      );

      if (data["status"] == "success") {
        final response = BookingResponse.fromJson(data);
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
  Future<Either<Failure, List<Message>>> getMessages(String bookingId) async {
    try {
      final data = await apiService.get(
        endpoint: 'bookings/getChatMessages/$bookingId',
      );

      if (data["status"] == "success") {
        final response = MessageResponse.fromJson(data);
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
  @override
  Future<Either<Failure, ReviewData>> addReview({
    required String comment,
    required int rating,
    required String serviceProviderId,
  }) async {
    try {
      final data = await apiService.post(
        endpoint: 'reviews/addReview',
        data: {
          "comment": comment,
          "rating": rating,
          "serviceprovider": serviceProviderId,
        },
      );

      if (data["status"] == "success") {
        final reviewJson = data["data"]["review"];
        final review = ReviewData.fromJson(reviewJson);
        return Right(review);
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
