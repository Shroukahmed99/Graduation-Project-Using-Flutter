import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/deletebutton.dart';
import 'cancel_button.dart';

class DeleteActions extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final DeleteAccountCubit deleteAccountCubit;

  const DeleteActions({
    Key? key,
    required this.bottomSheetCubit,
    required this.deleteAccountCubit,
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
          child: DeleteButton(bottomSheetCubit: bottomSheetCubit, deleteAccountCubit: deleteAccountCubit),
        ),
      ],
    );
  }
}
