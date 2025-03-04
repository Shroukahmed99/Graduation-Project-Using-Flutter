import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.title,
    this.onChanged,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  final String? hintText;
  final String title;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

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
        SizedBox(height: 5.h), // مسافة بين العنوان والحقل
        SizedBox(
          width: 320.w, // عرض الحقل
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h, // ✅ تثبيت الارتفاع حتى عند ظهور رسالة الخطأ
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  validator: validator,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.red, // ✅ لون أحمر عند الخطأ
                        width: 1,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h, // ✅ إبقاء الحقل بنفس الارتفاع دائمًا
                    ),
                    errorStyle: TextStyle(
                      fontSize: 12.sp, // ✅ تثبيت حجم الخطأ حتى لا يكبر الحقل
                      height: 0.4, // ✅ تقليل المسافة بين الحقل والخطأ
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      5.h), // ✅ مسافة صغيرة لرسالة الخطأ دون التأثير على الحقل
            ],
          ),
        ),
      ],
    );
  }
}
