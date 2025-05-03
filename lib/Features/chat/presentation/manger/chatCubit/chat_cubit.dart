import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/core/utils/socket_io_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;
  final SocketService socketService;

  ChatCubit({
    required this.chatRepo,
    required this.socketService,
  }) : super(ChatInitial());

  Future<void> initChat(String bookingId) async {
    emit(ChatLoading());

    final result = await chatRepo.getMessages(bookingId);

    result.fold(
      (failure) {
        emit(ChatFailure(failure.errorMessage));
      },
      (messages) {
        emit(ChatLoaded(messages: messages));

        socketService.connect(bookingId);

        socketService.onMessage((data) {
          try {
            final newMessage = Message.fromJson(data);

            if (state is ChatLoaded) {
              final updatedMessages =
                  List<Message>.from((state as ChatLoaded).messages)
                    ..add(newMessage);
              emit(ChatLoaded(messages: updatedMessages));
            }
          } catch (_) {}
        });
      },
    );
  }

  Future<void> sendMessage(Message message) async {
    if (state is ChatLoaded) {
      final updatedMessages = List<Message>.from((state as ChatLoaded).messages)
        ..add(message);
      emit(ChatLoaded(messages: updatedMessages));
    }

    socketService.sendMessage(message.toJson());
  }

  void closeConnection() {
    socketService.dispose();
  }
}
