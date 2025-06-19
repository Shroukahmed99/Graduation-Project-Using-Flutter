import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';

class ChatBotIntroButton extends StatelessWidget {
  const ChatBotIntroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            context.push(AppRouter.kChatBotView);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.zero,
          ),
          child:const Stack(
            children:  [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Positioned(
                right: 16,
                top: 14,
                child: Icon(Icons.arrow_forward, color: Colors.white ,size: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
