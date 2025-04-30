import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Community/data/models/get_all_post.dart';
import 'package:sehatak/Features/Community/presentation/manger/likePost/like_post_cubit.dart';
import 'package:sehatak/const.dart';

class CommunityAllPost extends StatelessWidget {
  final VoidCallback onCommentTap;
  final GetCommunity post;

  const CommunityAllPost({
    super.key,
    required this.onCommentTap,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final String postId = post.id;

    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 14.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage("assets/images/4.png"),
                ),
                SizedBox(width: 8.w),
                Text(
                  post.clientId.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              post.content,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<LikePostCubit>().likePost(postId);
                  },
                  child: BlocBuilder<LikePostCubit, LikePostState>(
                    builder: (context, state) {
                      int likes = post.likesCount;
                      bool isLiked = false;

                      if (state is LikePostSuccess && state.postId == post.id) {
                        likes = state.updatedLikesCount;
                        isLiked = state.isLiked;
                      }

                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<LikePostCubit>().likePost(postId);
                            },
                            child: Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : kPrimaryColor,
                              size: 18.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            likes.toString(),
                            style: const TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: onCommentTap,
                  child: Row(
                    children: [
                      Icon(Icons.sms, color: kPrimaryColor, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        post.commentCount.toString(),
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
