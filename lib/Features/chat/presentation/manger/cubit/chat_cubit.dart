import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/Features/chat/data/repo/mmmm.dart';

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
    print('Initializing chat for bookingId: $bookingId');

    final result = await chatRepo.getMessages(bookingId);

    result.fold(
      (failure) {
        print('Error loading messages: ${failure.errorMessage}');
        emit(ChatFailure(failure.errorMessage));
      },
      (messages) {
        print('Loaded messages: $messages');
        emit(ChatLoaded(messages: messages));

        // الاتصال بالـ Socket
        socketService.connect(bookingId);

        // الاستماع للرسائل الجديدة عبر الـ Socket
        socketService.onMessage((data) {
          print('Message received via socket: $data');
          try {
            final newMessage = Message.fromJson(data);

            if (state is ChatLoaded) {
              final updatedMessages =
                  List<Message>.from((state as ChatLoaded).messages)
                    ..add(newMessage);
              emit(ChatLoaded(messages: updatedMessages));
            }
          } catch (e) {
            print('Error parsing received message: $e');
          }
        });
      },
    );
  }

  void sendMessage(Message message) {
    print('Sending message from Cubit: ${message.toJson()}');

    // ✅ أضف الرسالة لـ UI مباشرة
    if (state is ChatLoaded) {
      final updatedMessages = List<Message>.from((state as ChatLoaded).messages)
        ..add(message);
      emit(ChatLoaded(messages: updatedMessages));
    }

    // ✅ ثم أرسلها للـ socket
    socketService.sendMessage(message.toJson());
  }

  void closeConnection() {
    socketService.dispose();
  }
}
