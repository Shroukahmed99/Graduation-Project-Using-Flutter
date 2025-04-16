// profile_info_card_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/info_card_widget.dart';
import 'package:sehatak/const.dart';

class ProfileInfoCardSection extends StatelessWidget {
  final ClientModel? client;
  
  const ProfileInfoCardSection({Key? key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 1.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: InfoCardWidget(
                title: "Weight",
                value: client?.weight != null ? '${client!.weight} kg' : '-- kg',

              ),
            ),
            SizedBox(
                width: 1.w,
                child: Container(color: Colors.white, width: 2.w, height: 50.h)),
            Expanded(
              child: InfoCardWidget(
                title: "Years Old",
                value: client?.age ?? '--',
              ),
            ),
            SizedBox(
                width: 1.w,
                child: Container(color: Colors.white, width: 2.w, height: 50.h)),
            Expanded(
              child: InfoCardWidget(
                title: "Height",
                value: client?.height != null ? '${client!.height} CM' : '-- CM',

              ),
            ),
          ],
        ),
      ),
    );
  }
}