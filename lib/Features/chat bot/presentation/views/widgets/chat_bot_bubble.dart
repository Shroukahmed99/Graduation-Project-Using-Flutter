import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sehatak/Features/chat%20bot/data/models/message_model.dart';

class ChatBotBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBotBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final timeString = DateFormat('hh:mm a').format(message.time);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Image.asset(
                'assets/images/chatpot icons/chatpot.png',
                width: 30,
                height: 30,
              ),
            ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              constraints: const BoxConstraints(
                maxWidth: 240,
              ),
              decoration: BoxDecoration(
                color: isUser ? const Color(0xFFFF6E40) : Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(14),
                  topRight: const Radius.circular(14),
                  bottomLeft: Radius.circular(isUser ? 14 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 14),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.message,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    timeString,
                    style: TextStyle(
                      color: isUser ? Colors.white70 : Colors.black45,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
