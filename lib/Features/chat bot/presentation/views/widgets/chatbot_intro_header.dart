import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class ChatBotIntroHeader extends StatelessWidget {
  const ChatBotIntroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children:  [
        Text(
          "You AI Assistant",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "Using this software, you can ask you questions and receive articles using\nartificial intelligence assistant",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff757575),
          ),
        ),
      ],
    );
  }
}
