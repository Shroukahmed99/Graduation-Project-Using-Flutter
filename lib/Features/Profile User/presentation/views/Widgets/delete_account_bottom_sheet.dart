import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_message_display.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/delete_actions.dart';
import 'package:sehatak/const.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final DeleteAccountCubit deleteAccountCubit;

  const DeleteAccountBottomSheet({
    Key? key,
    required this.bottomSheetCubit,
    required this.deleteAccountCubit,
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
          const CustomMessageDisplay(
            message: "Are you sure you want to\n delete your account?",
          ),
          SizedBox(height: 20.h),
          DeleteActions(
              bottomSheetCubit: bottomSheetCubit,
              deleteAccountCubit: deleteAccountCubit),
        ],
      ),
    );
  }
}
