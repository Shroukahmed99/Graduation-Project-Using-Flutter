import 'package:flutter/material.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/Community_all_post.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/comment_bottom_sheet.dart';

class CommunityAllPostListView extends StatelessWidget {
  const CommunityAllPostListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CommunityAllPost(onCommentTap: () => showCommentSheet(context));
      },
    );
  }
}
