import 'package:flutter/material.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/get_all_comment.dart';

class GetAllCommentListView extends StatelessWidget {
  const GetAllCommentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: GetAllComment(),
        );
      },
    );
  }
}
