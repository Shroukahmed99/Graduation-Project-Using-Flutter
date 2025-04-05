import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onChanged;
  final double width;

  const CustomDropdownWidget({
    Key? key,
    required this.title,
    required this.options,
    this.selectedValue,
    required this.onChanged,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: 5.h),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            width: width,
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: Text(title),
                    isExpanded: true,
                    isDense: true, 
                    icon: const Icon(Icons.arrow_drop_down),
                    borderRadius: BorderRadius.circular(15),
                    itemHeight: 48.0, 
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        onChanged(newValue);
                      }
                    },
                    items: options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
