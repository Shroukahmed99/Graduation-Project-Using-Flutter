import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_cubit.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_state.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/feature_item.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';

class PackageListWidget extends StatelessWidget {
  final List<Map<String, String>> packages;

  const PackageListWidget({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StripeCubit, StripeState>(
      builder: (context, state) {
        int? selectedIndex;
        if (state is StripePackageSelected) {
          selectedIndex = state.selectedIndex;
        }

        return SizedBox(
          height: 330.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final pkg = packages[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  BlocProvider.of<StripeCubit>(context).selectPackage(
                    selectedIndex: index,
                    selectedPrice: pkg['price']!,
                    selectedDuration: pkg['duration']!,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 190.w,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5.h),
                              Text(
                                pkg['title']!,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Text(
                                "${pkg['price']!} EGP",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Text(
                                pkg['label']!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 14.h),
                              const FeatureItem(text: "Customized Plan"),
                              SizedBox(height: 3.h),
                              const FeatureItem(text: "Chat for communication"),
                              SizedBox(height: 3.h),
                              const FeatureItem(text: "Important Advices"),
                              SizedBox(height: 3.h),
                              const FeatureItem(text: "Continuous follow-up"),
                              const Spacer(),
                              Center(
                                child: isSelected
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 30.sp,
                                      )
                                    : CustomButtomBookNow(
                                        colorText: Colors.black,
                                        fontSize: 11.sp,
                                        height: 30.h,
                                        width: 70.w,
                                        color: Colors.white,
                                        text: 'CHOOSE',
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15.h,
                        right: -18.w,
                        child: Transform.rotate(
                          angle: 0.785398,
                          child: Container(
                            color: Colors.black,
                            padding: EdgeInsets.symmetric(
                              vertical: 1.h,
                              horizontal: 20.w,
                            ),
                            child: Text(
                              'Best Offer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
