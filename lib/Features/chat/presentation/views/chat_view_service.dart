import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';
import 'package:sehatak/Features/chat/data/repo/mmmm.dart';
import 'package:sehatak/Features/chat/presentation/manger/cubit/chat_cubit.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/chat_view_body_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class ChatViewService extends StatelessWidget {
  final String bookingId;
  final ChatRepo chatRepo;
  final String senderId;
  final String receiverId;
  const ChatViewService(
      {super.key,
      required this.bookingId,
      required this.chatRepo,
      required this.senderId,
      required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(
        chatRepo: chatRepo,
        socketService: SocketService(),
      )..initChat(bookingId),
      child: Scaffold(
        body: ChatViewBodyService(
          bookingId: bookingId,
          senderId: senderId,
          receiverId: receiverId, // هتحط ID المستخدم الحالي هنا
        ),
        bottomNavigationBar: const CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}
