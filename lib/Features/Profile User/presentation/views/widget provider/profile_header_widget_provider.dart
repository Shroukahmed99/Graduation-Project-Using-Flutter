import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_text_and_icon_inline.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/profile_image_with_icon.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_info_card_section_provider.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_provider_user_info_texts.dart';
import 'package:sehatak/const.dart';

class ProfileHeaderWidgetProvider extends StatelessWidget {
  final ProviderModel? provider;
  final bool showEditIcon;
  final VoidCallback onTap; 

  const ProfileHeaderWidgetProvider({
    Key? key,
    this.provider,
    this.showEditIcon = false,
     required this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 291.h,
          padding: EdgeInsets.all(12.w),
          margin: EdgeInsets.only(bottom: 30.h),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextAndIconInlineProfile(
                onTap: onTap ,
                text: "My Profile",
                colorArrowIcon: Colors.black,
                colorText: Colors.black,
              ),
              SizedBox(height: 20.h),
              ProfileImageWithIcon(showEditIcon: showEditIcon),
              SizedBox(height: 5.h),
              ProfileProviderUserInfoTexts(provider: provider),
              SizedBox(height: 15.h),
            ],
          ),
        ),
        Positioned(
          bottom: -5.h,
          left: 0,
          right: 0,
          child: ProfileInfoCardSectionProvider(provider: provider),
        ),
      ],
    );
  }
}
