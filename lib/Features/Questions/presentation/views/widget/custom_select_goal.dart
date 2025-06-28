import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSelectGoal extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelect;

  const CustomSelectGoal({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: 400.w,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(options.length, (index) {
            return GestureDetector(
              onTap: () {
                onSelect(options[index]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                height: 50.h,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      options[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      width: 22.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2.w),
                        color: selectedOption == options[index]
                            ? Colors.orange
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
