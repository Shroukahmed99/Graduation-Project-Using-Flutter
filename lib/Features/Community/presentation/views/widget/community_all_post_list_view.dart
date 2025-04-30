import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Community/presentation/manger/getAllPost/get_all_post_cubit.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/Community_all_post.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/comment_bottom_sheet.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class CommunityAllPostListView extends StatelessWidget {
  const CommunityAllPostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPostCubit, GetAllPostState>(
      builder: (context, state) {
        if (state is GetAllPostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllPostFailure) {
          customSnackBar(context, state.message);
          return const SizedBox.shrink();
        } else if (state is GetAllPostSuccess) {
          final posts = state.post;
          return ListView.builder(
            itemCount: posts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return CommunityAllPost(
                post: post,
                onCommentTap: () => showCommentSheet(context),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
