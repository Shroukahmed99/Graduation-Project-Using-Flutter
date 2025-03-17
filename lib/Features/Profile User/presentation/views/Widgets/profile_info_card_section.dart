import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/info_card_widget.dart';
import 'package:sehatak/const.dart';

class ProfileInfoCardSection extends StatelessWidget {
  const ProfileInfoCardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            const Expanded(
              child: InfoCardWidget(
                title: "Weight",
                value: '15 kg',
              ),
            ),
            SizedBox(
                width: 1.w,
                child: Container(color: Colors.white, width: 2, height: 50)),
            const Expanded(
              child: InfoCardWidget(
                title: "Years Old",
                value: '23',
              ),
            ),
            SizedBox(
                width: 1.w,
                child: Container(color: Colors.white, width: 2, height: 50)),
            const Expanded(
              child: InfoCardWidget(
                title: "Height",
                value: '162 CM',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
