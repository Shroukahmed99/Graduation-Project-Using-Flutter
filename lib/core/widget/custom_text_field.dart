import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.title,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.validator,
    required this.width,
    this.isNumeric = false,
    this.isAlpha = false,
    this.enabled,
  });

  final String? hintText;
  final String title;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double width;
  final bool isNumeric;
  final bool isAlpha;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final isEditable = enabled ?? true;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                  child: TextFormField(
                    controller: controller,
                    obscureText: obscureText,
                    validator: validator,
                    onChanged: onChanged,
                    enabled: enabled,
                    keyboardType:
                        isNumeric ? TextInputType.number : TextInputType.text,
                    inputFormatters: isNumeric
                        ? [FilteringTextInputFormatter.digitsOnly]
                        : (isAlpha
                            ? [FilteringTextInputFormatter.deny(RegExp(r'\d'))]
                            : []),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black, // لون النص دائمًا أسود
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      errorStyle: TextStyle(
                        fontSize: 12.sp,
                        height: 0.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
