import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/bookingId/booking_id_cubit.dart';
import 'package:sehatak/const.dart';

class AcceptButtons extends StatelessWidget {
  final String clientId;

  const AcceptButtons({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: SizedBox(
            height: 20.h,
            width: 60.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                BlocProvider.of<BookingIdCubit>(context).respondToBooking(
                  id: clientId,
                  status: 'reject',
                );
              },
              child: Text(
                'Reject',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: SizedBox(
            height: 20.h,
            width: 60.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                BlocProvider.of<BookingIdCubit>(context).respondToBooking(
                  id: clientId,
                  status: 'accept',
                );
              },
              child: Text(
                'Accept',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
