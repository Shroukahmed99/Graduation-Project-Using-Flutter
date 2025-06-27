import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_cubit.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 44.h,
      child: ElevatedButton(
        onPressed: () {
          context.read<FitnessCubit>().refreshFitnessData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          "Refresh Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
