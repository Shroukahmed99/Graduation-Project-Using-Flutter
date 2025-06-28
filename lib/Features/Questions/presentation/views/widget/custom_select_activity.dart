import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class CustomSelectActivity extends StatefulWidget {
  final List<String> options;
  final Function(int)? onSelect;

  const CustomSelectActivity({
    super.key,
    required this.options,
    this.onSelect,
  });

  @override
  _CustomSelectActivityState createState() => _CustomSelectActivityState();
}

class _CustomSelectActivityState extends State<CustomSelectActivity> {
  int? selectedIndex;

  Future<void> saveData() async {
    if (selectedIndex != null) {
      await CacheHelper.saveData(
        key: 'physicalActivityLevel',
        value: widget.options[selectedIndex!],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.options.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onSelect?.call(index);
            saveData();
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: selectedIndex == index ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(38.r),
              ),
              height: 64.h,
              width: 320.w,
              alignment: Alignment.center,
              child: Text(
                widget.options[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'League Spartan',
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
