
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat%20bot/data/models/message_model.dart';
import 'package:sehatak/Features/chat%20bot/data/repos/chat_bot_repo.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepo chatRepo;

  ChatBotCubit(this.chatRepo) : super(ChatBotState(messages: [])) {
    loadMessagesFromCache();
  }

  Future<void> sendMessage(String message) async {
    final userMessage = MessageModel(
      isUser: true,
      message: message,
      time: DateTime.now(),
    );

    final updatedMessages = [...state.messages, userMessage];
    emit(ChatBotState(messages: updatedMessages));
    await saveMessagesToCache(updatedMessages);

    try {
      final reply = await chatRepo.sendMessageToBot(message);
      final botMessage = MessageModel(
        isUser: false,
        message: reply,
        time: DateTime.now(),
      );

      final allMessages = [...updatedMessages, botMessage];
      emit(ChatBotState(messages: allMessages));
      await saveMessagesToCache(allMessages);
    } catch (_) {
      final errorMessage = MessageModel(
        isUser: false,
        message: "An error occurred while connecting to the server.",
        time: DateTime.now(),
      );

      final allMessages = [...updatedMessages, errorMessage];
      emit(ChatBotState(messages: allMessages));
      await saveMessagesToCache(allMessages);
    }
  }

  Future<void> saveMessagesToCache(List<MessageModel> messages) async {
    final email = CacheHelper.getData(key: 'email');
    if (email == null) return;

    final data = jsonEncode(messages.map((e) => e.toJson()).toList());
    await CacheHelper.saveData(key: 'chat_messages_$email', value: data);
  }

  void loadMessagesFromCache() {
    final email = CacheHelper.getData(key: 'email');
    if (email == null) return;

    final cachedData = CacheHelper.getData(key: 'chat_messages_$email');
    if (cachedData != null) {
      try {
        final List decodedList = jsonDecode(cachedData);
        final messages = decodedList
            .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(ChatBotState(messages: messages));
      } catch (_) {
        emit(ChatBotState(messages: []));
      }
    }
  }
}
