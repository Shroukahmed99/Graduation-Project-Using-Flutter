import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo_impl.dart';
import 'package:sehatak/Features/chat/presentation/manger/allChatClient/all_chat_client_cubit.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/all_chat_client_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

class AllChatClientView extends StatelessWidget {
  const AllChatClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllChatClientCubit(ChatRepoImpl(ApiService(Dio())))..allChat(),
      child: const Scaffold(
        body: AllChatClientViewBody(),
      ),
    );
  }
}
