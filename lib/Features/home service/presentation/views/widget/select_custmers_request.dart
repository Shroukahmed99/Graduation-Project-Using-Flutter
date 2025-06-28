import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/newCustmer/new_custmer_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/select_customer/home_service_tab_cubit_cubit.dart';
import 'package:sehatak/const.dart';

class SelectCustomersTab extends StatelessWidget {
  const SelectCustomersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final showNew = context.watch<HomeServiceTabCubit>().state;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.read<HomeServiceTabCubit>().showCustomers(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: !showNew ? kPrimaryColor : accentColor,
                  borderRadius: BorderRadius.circular(23.r),
                ),
                child: Text(
                  "customers",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 60.w),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () =>
                      context.read<HomeServiceTabCubit>().showNewCustomers(),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: showNew ? kPrimaryColor : accentColor,
                      borderRadius: BorderRadius.circular(23.r),
                    ),
                    child: Text(
                      "new customers",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                BlocSelector<NewCustmerCubit, NewCustmerState, int>(
                  selector: (state) {
                    if (state is NewCustmerSuccess) {
                      return state.data.length;
                    } else {
                      return 0;
                    }
                  },
                  builder: (context, newCustomersCount) {
                    if (newCustomersCount == 0) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      top: -10.h,
                      right: -8.w,
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$newCustomersCount',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
