import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class ChatBotIntroImage extends StatelessWidget {
  const ChatBotIntroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176,
      height: 200,
      child: Image.asset(
        IconPaths.chatbot,
        fit: BoxFit.contain,
      ),
    );
  }
}
