import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/core/utils/socket_io_service.dart';
import 'package:sehatak/Features/chat/presentation/manger/chatCubit/chat_cubit.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/chat_view_body_client.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class ChatViewClient extends StatelessWidget {
  final String bookingId;
  final ChatRepo chatRepo;
  final String senderId;
  final String receiverId;

  const ChatViewClient({
    super.key,
    required this.bookingId,
    required this.chatRepo,
    required this.senderId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(
        chatRepo: chatRepo,
        socketService: SocketService(),
      )..initChat(bookingId),
      child: const Scaffold(
        body: SafeArea(
          bottom: false, // نسيب المساحة لتحت للبار فقط
          child: ChatViewBodyClient(
            bookingId: '', // replace if needed
            senderId: '',
            receiverId: '',
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false, // علشان مانسيبش مساحة زيادة فوق
          child: CustomBottomNavigationHomeClient(),
        ),
      ),
    );
  }
}
