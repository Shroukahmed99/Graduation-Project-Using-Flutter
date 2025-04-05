import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_state.dart';
import 'package:sehatak/const.dart';

class DeleteButton extends StatelessWidget {
  final BottomSheetCubit bottomSheetCubit;
  final DeleteAccountCubit deleteAccountCubit;

  const DeleteButton({Key? key, required this.bottomSheetCubit, required this.deleteAccountCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      bloc: deleteAccountCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is DeleteAccountLoading ? null : () => deleteAccountCubit.deleteAccount(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: state is DeleteAccountLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  "Yes,delete",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
        );
      },
    );
  }
}
