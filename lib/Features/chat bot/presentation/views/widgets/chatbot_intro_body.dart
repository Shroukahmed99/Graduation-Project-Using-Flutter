import 'package:flutter/material.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chatbot_intro_button.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chatbot_intro_header.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chatbot_intro_image.dart';

class ChatBotIntroBody extends StatelessWidget {
  const ChatBotIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(height: 24),
          Column(
            children: [
              ChatBotIntroHeader(),
              SizedBox(height: 60),
              ChatBotIntroImage(),
            ],
          ),
          ChatBotIntroButton(),
        ],
      ),
    );
  }
}
