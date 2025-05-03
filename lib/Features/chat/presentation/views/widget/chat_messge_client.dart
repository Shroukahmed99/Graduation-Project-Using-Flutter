import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/presentation/manger/cubit/chat_cubit.dart';
import 'package:sehatak/const.dart';

class ChatMessageClient extends StatefulWidget {
  final String bookingId;
  final String senderId;
  final String receiverId; // ✅ أضفنا هذا

  const ChatMessageClient({
    super.key,
    required this.bookingId,
    required this.senderId,
    required this.receiverId, // ✅
  });

  @override
  _ChatViewBodyState createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatMessageClient> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('Initializing chat for bookingId: ${widget.bookingId}');
    context.read<ChatCubit>().initChat(widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        print('Current state: $state');
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(12),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages.reversed.toList()[index];
                    return ChatBubble(
                      message: message,
                      isMine: message.senderId == widget.senderId,
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
                              horizontal: 16, vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          final text = _messageController.text.trim();
                          if (text.isNotEmpty) {
                            final message = Message(
                              bookingId: widget.bookingId,
                              senderId: widget.senderId,
                              receiverId: widget.receiverId,
                              senderType: 'client',
                              text: text,
                            );
                            context.read<ChatCubit>().sendMessage(message);
                            _messageController.clear();
                          }
                        },
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
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const ChatBubble({super.key, required this.message, required this.isMine});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          color: isMine ? kPrimaryColor : const Color(0xffEEEFEF),
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
  }
}
