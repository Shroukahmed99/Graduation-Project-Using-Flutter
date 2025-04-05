import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/const.dart';
import 'custom_message_display.dart';
import 'logout_actions.dart';

class LogoutBottomSheet extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final LogoutCubit logoutCubit;

  const LogoutBottomSheet({
    Key? key,
    required this.bottomSheetCubit,
    required this.logoutCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        const  CustomMessageDisplay(
  message: "Are you sure you want to\n log out?",
 
),

          SizedBox(height: 20.h),
          LogoutActions(bottomSheetCubit: bottomSheetCubit, logoutCubit: logoutCubit),
        ],
      ),
    );
  }
}
