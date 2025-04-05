import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/const.dart';

class CancelButton extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;

  const CancelButton({Key? key, required this.bottomSheetCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bottomSheetCubit.hideBottomSheet();
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
      ),
      child: Text(
        'Cancel',
        style: TextStyle(
          color: accentColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
