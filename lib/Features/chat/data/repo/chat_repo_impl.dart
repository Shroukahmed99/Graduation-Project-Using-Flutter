import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      print(
          'Fetching messages for bookingId: $bookingId'); // برنت عند تحميل الرسائل
      final data = await apiService.get(
        endpoint: 'bookings/getChatMessages/$bookingId',
      );

      print('API Response: $data'); // برنت لعرض رد السيرفر

      if (data["status"] == "success") {
        final response = MessageResponse.fromJson(data);
        return Right(response.data);
      } else {
        return Left(ServerFailure(data["message"] ?? "Unexpected error"));
      }
    } catch (e) {
      print('Error fetching messages: $e'); // برنت عند حدوث خطأ
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
