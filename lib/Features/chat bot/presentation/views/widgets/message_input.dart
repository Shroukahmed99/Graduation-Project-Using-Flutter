import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';


class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSendMessage;

  const MessageInput({
    required this.controller,
    required this.onSendMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type Message',
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
          GestureDetector(
            onTap: () {
              final message = controller.text.trim();
              if (message.isNotEmpty) {
                onSendMessage(message);
                controller.clear();
              }
            },
            child: const CircleAvatar(
              backgroundColor: kPrimaryColor,
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
