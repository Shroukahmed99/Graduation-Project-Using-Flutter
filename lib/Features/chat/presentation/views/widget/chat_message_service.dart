import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/chat/data/models/message.dart';
import 'package:sehatak/Features/chat/presentation/manger/chatCubit/chat_cubit.dart';
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
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().initChat(widget.bookingId);
  }

  void _sendMessage() async {
    if (_isSending) return;

    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isSending = true;
    });

    final message = Message(
      bookingId: widget.bookingId,
      senderId: widget.senderId,
      receiverId: widget.receiverId,
      senderType: 'service_provider',
      text: text,
    );

    await context.read<ChatCubit>().sendMessage(message);
    _messageController.clear();

    setState(() {
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          final allMessages = state.messages.reversed.toList();

          final welcomeMessage = allMessages.firstWhere(
            (msg) => msg.text.contains('مرحب') || msg.text.contains('أهلاً'),
            orElse: () => Message(
              bookingId: '',
              senderId: '',
              receiverId: '',
              senderType: '',
              text: '',
            ),
          );

          final chatMessages = allMessages
              .where(
                (msg) => msg.text != welcomeMessage.text,
              )
              .toList();

          return Column(
            children: [
              if (welcomeMessage.text.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Text(
                    welcomeMessage.text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(1.w),
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      final message = chatMessages[index];
                      final isMine = message.senderId == widget.senderId;
                      return Align(
                        alignment: isMine
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          margin: EdgeInsets.symmetric(
                            vertical: 4.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: isMine
                                ? kPrimaryColor
                                : const Color(0xffEEEFEF),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: isMine ? Colors.white : Colors.black87,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: kPrimaryColor,
                      child: IconButton(
                        icon:
                            Icon(Icons.send, color: Colors.white, size: 20.sp),
                        onPressed: _isSending ? null : _sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is ChatFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: kPrimaryColor,
              ),
            );
          }); 
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
