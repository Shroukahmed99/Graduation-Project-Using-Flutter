part of 'all_chat_client_cubit.dart';

@immutable
sealed class AllChatClientState {}

final class AllChatClientInitial extends AllChatClientState {}

final class AllChatClientLoading extends AllChatClientState {}

final class AllChatClientSuccess extends AllChatClientState {
  final List<BookingData> data;

  AllChatClientSuccess(this.data);
}

final class AllChatClientFailure extends AllChatClientState {
  final String message;

  AllChatClientFailure(this.message);
}
