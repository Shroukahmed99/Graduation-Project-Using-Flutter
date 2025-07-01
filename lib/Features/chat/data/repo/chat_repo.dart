import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/chat/data/models/add_review.dart';
import 'package:sehatak/Features/chat/data/models/all_chat.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<BookingData>>> allChat();
  Future<Either<Failure, List<Message>>> getMessages(String bookingId);
  Future<Either<Failure, ReviewData>> addReview({
    required String comment,
    required int rating,
    required String serviceProviderId,
  });
}
