import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/presentation/manger/cubit/chat_cubit.dart';
import 'package:sehatak/const.dart';

class ChatMessageService extends StatefulWidget {
  final String bookingId;
  final String receiverId;
  final String senderId;

  const ChatMessageService({
    super.key,
    required this.bookingId,
    required this.receiverId,
    required this.senderId,
  });

  @override
  State<ChatMessageService> createState() => _ChatMessageServiceState();
}

class _ChatMessageServiceState extends State<ChatMessageService> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(List<Message> messages) {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final receiverId = messages
        .firstWhere(
          (m) => m.senderId != widget.senderId,
          orElse: () => Message(
            bookingId: '',
            senderId: '',
            receiverId: '',
            text: '',
            senderType: '',
          ),
        )
        .senderId;

    if (receiverId.isEmpty) {
      print('❌ Cannot send message: receiverId is empty');
      return;
    }

    final message = Message(
      bookingId: widget.bookingId,
      senderId: widget.senderId,
      receiverId: receiverId,
      senderType: 'service_provider',
      text: text,
    );

    print('📤 Sending message from UI: ${message.text}');
    print('📤 Message Details: $message');

    context.read<ChatCubit>().sendMessage(message);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatLoaded) {
            final messages = state.messages.reversed.toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMine = message.senderId == widget.senderId;
                      return Align(
                        alignment: isMine
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isMine
                                ? kPrimaryColor
                                : const Color(0xffEEEFEF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: isMine ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Type message...',
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () => _sendMessage(state.messages),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is ChatFailure) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
