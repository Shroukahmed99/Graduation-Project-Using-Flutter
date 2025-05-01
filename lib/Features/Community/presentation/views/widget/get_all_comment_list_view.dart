import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Community/presentation/manger/getAllComment/get_all_comment_cubit.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/get_all_comment.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class GetAllCommentListView extends StatelessWidget {
  final String postId;
  const GetAllCommentListView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCommentCubit, GetAllCommentState>(
      builder: (context, state) {
        if (state is GetAllCommentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCommentFailure) {
          customSnackBar(context, state.message);
          return const SizedBox.shrink();
        } else if (state is GetAllCommentSuccess) {
          final comments = state.comment;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GetAllComment(comment: comments[index]),
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
