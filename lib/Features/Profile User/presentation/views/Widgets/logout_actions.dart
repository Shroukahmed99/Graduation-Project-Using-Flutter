import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/logout_bottun.dart';
import 'cancel_button.dart';

class LogoutActions extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final LogoutCubit logoutCubit;

  const LogoutActions({
    Key? key,
    required this.bottomSheetCubit,
    required this.logoutCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CancelButton(bottomSheetCubit: bottomSheetCubit),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: LogoutButton(bottomSheetCubit: bottomSheetCubit, logoutCubit: logoutCubit),
        ),
      ],
    );
  }
}
