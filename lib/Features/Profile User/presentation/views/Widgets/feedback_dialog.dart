import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class FeedbackDialog {
  static void show(BuildContext context, String message, bool isSuccess, StreamController<int>? countdownController) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return StreamBuilder<int>(
          stream: countdownController?.stream,
          initialData: 5,
          builder: (context, snapshot) {
            return Container(
              height: 200.h, // استخدام .h لضبط الارتفاع
              padding: EdgeInsets.all(20.w), // استخدام .w لضبط الحواف
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)), // استخدام .r لتحديد نصف القطر
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      isSuccess ? "$message ${snapshot.data} seconds." : message,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp), // استخدام .sp لضبط حجم النص
                    ),
                  ),
                  SizedBox(width: 10.w), // استخدام .w لتحديد المسافة
                  isSuccess
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Icon(Icons.error, color: Colors.white),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
