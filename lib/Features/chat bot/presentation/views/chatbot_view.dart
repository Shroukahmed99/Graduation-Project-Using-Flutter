import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/chat%20bot/data/repos/chat_bot_repo_impl.dart';
import 'package:sehatak/Features/chat%20bot/presentation/manager/chatbot%20cubit/chat_bot_cubit.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/widgets/chatbot_body.dart';

import 'package:sehatak/core/utils/api_service.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(Dio());
    final chatRepo = ChatBotRepoImpl(apiService);

    return BlocProvider(
      create: (_) => ChatBotCubit(chatRepo),
      child: const ChatBotBody(),
    );
  }
}
