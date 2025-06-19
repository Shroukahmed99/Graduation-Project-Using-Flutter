import 'package:flutter/material.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chatbot_intro_body.dart';

class ChatBotIntroView extends StatelessWidget {
  const ChatBotIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ChatBotIntroBody(),
      ),
    );
  }
}
