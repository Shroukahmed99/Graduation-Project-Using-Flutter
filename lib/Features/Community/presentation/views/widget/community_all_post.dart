import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Community/data/models/get_all_post.dart';
import 'package:sehatak/Features/Community/presentation/manger/likePost/like_post_cubit.dart';
import 'package:sehatak/const.dart';

class CommunityAllPost extends StatefulWidget {
  final ValueChanged<String> onCommentTap;
  final GetCommunity post;

  const CommunityAllPost({
    super.key,
    required this.onCommentTap,
    required this.post,
  });

  @override
  State<CommunityAllPost> createState() => _CommunityAllPostState();
}

class _CommunityAllPostState extends State<CommunityAllPost> {
  late int likes;
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    likes = widget.post.likesCount;
    isLiked = widget.post.isLiked;
  }

  void _toggleLike() {
    context.read<LikePostCubit>().likePost(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, right: 35.w, bottom: 14.h),
      child: Column(
        children: [
          // جزء الصورة واسم الشخص خارج الكونتينر
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const AssetImage("assets/images/4.png"),
              ),
              SizedBox(width: 8.w),
              Text(
                widget.post.clientId.fullName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 10),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // النص
          Text(
            widget.post.content,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),

          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: kPrimaryColor),
              image: DecorationImage(
                image: NetworkImage(widget.post.img.toString()),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocListener<LikePostCubit, LikePostState>(
                    listener: (context, state) {
                      if (state is LikePostSuccess &&
                          state.postId == widget.post.id) {
                        setState(() {
                          likes = state.updatedLikesCount;
                          isLiked = state.isLiked;
                        });
                      }
                    },
                    child: GestureDetector(
                      onTap: _toggleLike,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : kPrimaryColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            likes.toString(),
                            style: const TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => widget.onCommentTap(widget.post.id),
                    child: Row(
                      children: [
                        Icon(Icons.sms, color: kPrimaryColor, size: 18.sp),
                        SizedBox(width: 4.w),
                        Text(
                          widget.post.commentCount.toString(),
                          style: const TextStyle(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
