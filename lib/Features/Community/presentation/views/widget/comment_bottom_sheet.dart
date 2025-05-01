import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo_impl.dart';
import 'package:sehatak/Features/Community/presentation/manger/createComment/create_comment_cubit.dart';
import 'package:sehatak/Features/Community/presentation/manger/getAllComment/get_all_comment_cubit.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/get_all_comment_list_view.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/api_service.dart';

class CommentBottomSheet extends StatelessWidget {
  final String postId;

  const CommentBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final addCommentCubit = context.read<AddCommentCubit>();

    return Container(
      height: 0.6.sh,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          Text(
            "Comments",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: SingleChildScrollView(
              child: GetAllCommentListView(postId: postId),
            ),
          ),
          SizedBox(height: 12.h),
          BlocConsumer<AddCommentCubit, AddCommentState>(
            listener: (context, state) {
              if (state is AddCommentSuccess) {
                context.read<GetAllCommentCubit>().getAllComment(postId);
              } else if (state is AddCommentFailure) {
                customSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: const AssetImage("assets/images/4.png"),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      controller: addCommentCubit.commentController,
                      decoration: InputDecoration(
                        hintText: "Write your comment...",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => addCommentCubit.addComment(postId),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: kPrimaryColor,
                      child: state is AddCommentLoading
                          ? SizedBox(
                              height: 16.sp,
                              width: 16.sp,
                              child: const CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : Icon(Icons.send, color: Colors.white, size: 18.sp),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

void showCommentSheet(BuildContext context, String postId) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllCommentCubit(
            CommunityRepoImpl(ApiService(Dio())),
          )..getAllComment(postId),
        ),
        BlocProvider(
          create: (context) => AddCommentCubit(
            CommunityRepoImpl(ApiService(Dio())),
          ),
        ),
      ],
      child: CommentBottomSheet(postId: postId),
    ),
  );
}
