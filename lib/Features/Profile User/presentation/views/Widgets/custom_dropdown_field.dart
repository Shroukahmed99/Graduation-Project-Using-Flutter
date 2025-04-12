import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomDropdownField extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;
  final double width;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.width,
    this.validator,
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
        SizedBox(
          width: width,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            value: selectedValue,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 14.sp)),
                    ))
                .toList(),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
