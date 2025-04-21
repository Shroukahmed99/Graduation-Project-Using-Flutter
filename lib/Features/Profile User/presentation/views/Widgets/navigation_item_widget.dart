import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class NavigationItemWidget extends StatelessWidget {
  final String title;
  final String iconPath; 
  final VoidCallback? onTap;

  const NavigationItemWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      builder: (context, state) {
        final bool isBottomSheetVisible = state is BottomSheetVisible;
        final Color textColor = isBottomSheetVisible ? Colors.white : usedColor;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: kPrimaryColor,
                  child: Image.asset(
                    iconPath,
                    width: 22.r,
                    height: 22.r,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(width: 17.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                const Spacer(),
                CustomArrowIcon(flipToRight: true, onTap: () {  },),
              ],
            ),
          ),
        );
      },
    );
  }
}
