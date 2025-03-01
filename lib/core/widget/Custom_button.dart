import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap, // ✅ جعل onTap اختياريًا
  });

  final String text;
  final void Function()? onTap; // ✅ دعم الدوال الاختيارية

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ لن يحدث خطأ إذا كان null
      child: Center(
        child: Container(
          width: 211,
          height: 44,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 8),
                spreadRadius: 2,
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: backgroundColor,
              width: 0.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
