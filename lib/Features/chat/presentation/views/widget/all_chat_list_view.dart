import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/presentation/manger/allChatClient/all_chat_client_cubit.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/custom_all_chat.dart';

class AllChatListView extends StatelessWidget {
  const AllChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllChatClientCubit, AllChatClientState>(
      builder: (context, state) {
        if (state is AllChatClientLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllChatClientFailure) {
          return Center(child: Text(state.message));
        } else if (state is AllChatClientSuccess) {
          final client = state.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: client.length,
            itemBuilder: (context, index) {
              return CustomAllChat(data: client[index]);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
