import 'package:flutter/material.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/chat_message_service.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_app_bar_jop.dart';

class ChatViewBodyService extends StatelessWidget {
  final String bookingId;
  final String senderId;
  final String receiverId;
  const ChatViewBodyService({
    super.key,
    required this.bookingId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarJob(
          title: 'Chats',
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ChatMessageService(
            bookingId: bookingId,
            senderId: senderId,
            receiverId: receiverId,
          ),
        )
      ],
    );
  }
}
