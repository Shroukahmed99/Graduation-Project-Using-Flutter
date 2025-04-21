import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/info_card_widget.dart';
import 'package:sehatak/const.dart';
class ProfileInfoCardSectionProvider extends StatelessWidget {
  final ProviderModel? provider;

  ProfileInfoCardSectionProvider({Key? key, this.provider}) : super(key: key);

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
                title: "Experience",
                value: provider?.yearsOfExperience != null
                    ? '${provider?.yearsOfExperience} yrs'
                    : '-- yrs',
              ),
            ),
            SizedBox(
              width: 1.w,
              child: Container(color: Colors.white, width: 2.w, height: 50.h),
            ),
            Expanded(
              child: InfoCardWidget(
                title: "Age",
                value: provider?.age ?? '-- yrs',
              ),
            ),
            SizedBox(
              width: 1.w,
              child: Container(color: Colors.white, width: 2.w, height: 50.h),
            ),
            Expanded(
              child: InfoCardWidget(
                title: "Price",
                value: provider?.priceRange != null
                    ? '${provider?.priceRange} EGP'
                    : '-- EGP',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
