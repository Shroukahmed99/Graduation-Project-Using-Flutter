part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  ChatLoaded({required this.messages});
}

class ChatFailure extends ChatState {
  final String message;

  ChatFailure(this.message);
}
