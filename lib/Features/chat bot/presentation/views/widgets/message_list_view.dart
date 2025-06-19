// lib/widgets/message_list_view.dart
import 'package:flutter/material.dart';
import 'package:sehatak/Features/chat%20bot/data/models/message_model.dart';
import 'chat_bot_bubble.dart';

class MessageListView extends StatelessWidget {
  final List<MessageModel> messages;

  const MessageListView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatBotBubble(message: messages[index]);
      },
    );
  }
}
