import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Community/presentation/views/widget/get_all_comment_list_view.dart';
import 'package:sehatak/const.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: GetAllCommentListView(),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage: const AssetImage("assets/images/4.png"),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
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
              CircleAvatar(
                radius: 20.r,
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.send, color: Colors.white, size: 18.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showCommentSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const CommentBottomSheet(),
  );
}
