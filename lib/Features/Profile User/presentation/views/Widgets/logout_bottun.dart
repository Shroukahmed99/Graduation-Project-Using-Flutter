import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_state.dart';
import 'package:sehatak/const.dart';
class LogoutButton extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final LogoutCubit logoutCubit;

  const LogoutButton({Key? key, required this.bottomSheetCubit, required this.logoutCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      bloc: logoutCubit,
      listener: (context, state) {
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is LogoutLoading ? null : () => logoutCubit.logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: state is LogoutLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  "Yes, logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
        );
      },
    );
  }
}
