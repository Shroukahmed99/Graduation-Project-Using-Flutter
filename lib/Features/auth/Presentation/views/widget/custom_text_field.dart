import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.title,
    this.onChanged,
    this.obscureText = false,
    required this.controller, // ✅ إضافة الـ controller
  });

  final String? hintText;
  final String title;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController controller; // ✅ متغير للتحكم في النص

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص للحقل
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h), // مسافة بين العنوان والحقل
        SizedBox(
          width: 320.w, // عرض الحقل
          height: 45.h, // ارتفاع الحقل
          child: TextFormField(
            controller: controller, // ✅ استخدام الـ controller
            obscureText: obscureText,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'Field is required';
              }
              return null; // لا توجد أخطاء
            },
            onChanged: onChanged,
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
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
