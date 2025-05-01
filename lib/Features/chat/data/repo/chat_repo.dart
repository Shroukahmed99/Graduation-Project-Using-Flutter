import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/chat/data/models/all_chat.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<BookingData>>> allChat();
}
