import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/chat/presentation/views/widget/all_chat_list_view.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/custom_app_bar_jop.dart';

class AllChatClientViewBody extends StatelessWidget {
  const AllChatClientViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomAppBarJob(
          title: 'Chats',
        ),
        SizedBox(height: 20.h),
        const AllChatListView(),
      ],
    );
  }
}
