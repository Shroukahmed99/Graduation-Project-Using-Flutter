import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_state.dart';
import 'package:sehatak/const.dart';

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
    final textColor = bottomSheetCubit.currentTextColor;

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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want\n to log out?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontFamily: 'League Spartan',
                fontSize: 28.sp,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none,
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
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
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: BlocBuilder<LogoutCubit, LogoutState>(
                    bloc: logoutCubit,
                    builder: (context, state) {
                      if (state is LogoutSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          bottomSheetCubit.hideBottomSheet();
                          Navigator.pop(context);
                        });
                      } else if (state is LogoutError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        });
                      }

                      return ElevatedButton(
                        onPressed: state is LogoutLoading
                            ? null
                            : () => logoutCubit.logout(),
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
                                child: CircularProgressIndicator(
                                  color: textColor,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Yes, logout",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                      );
                    },
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
