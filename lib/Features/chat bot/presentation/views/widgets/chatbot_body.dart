import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat%20bot/presentation/manager/chatbot%20cubit/chat_bot_cubit.dart';
import 'package:sehatak/Features/chat%20bot/presentation/manager/chatbot%20cubit/chat_bot_state.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chat_bot_bubble.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/custom_app_bar.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/message_input.dart';

class ChatBotBody extends StatelessWidget {
  const ChatBotBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBotCubit, ChatBotState>(
              builder: (context, state) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (scrollController.hasClients) {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                });

                return ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return ChatBotBubble(message: state.messages[index]);
                  },
                );
              },
            ),
          ),
          MessageInput(
            controller: controller,
            onSendMessage: (text) {
              context.read<ChatBotCubit>().sendMessage(text);
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
