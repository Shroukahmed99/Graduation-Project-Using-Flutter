import 'package:flutter/material.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/chat_view_body.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatViewBody(),
      bottomNavigationBar: CustomBottomNavigationHomeClient(),
    );
  }
}
