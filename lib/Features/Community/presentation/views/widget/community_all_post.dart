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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage: const AssetImage("assets/images/4.png"),
              ),
              SizedBox(width: 10.w),
              Text(
                widget.post.clientId.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            widget.post.content,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          if ((widget.post.img ?? '').isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.network(
                  widget.post.img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(height: 14.h),
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
                        size: 20.sp,
                      ),
                      SizedBox(width: 5.w),
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
                    Icon(Icons.sms, color: kPrimaryColor, size: 20.sp),
                    SizedBox(width: 5.w),
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
    );
  }
}
