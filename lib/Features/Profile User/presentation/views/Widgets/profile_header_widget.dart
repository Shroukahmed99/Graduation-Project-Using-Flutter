import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_image_with_icon.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_info_card_section.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_user_info_texts.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_and_icon_arrowBack.dart';
import 'package:sehatak/const.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final File? pickedImage;
  final Future<void> Function() onPickImage;

  const ProfileHeaderWidget({
    Key? key,
    required this.pickedImage,
    required this.onPickImage,
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
              const CustomTextAndIconArrowback(
                text: "My Profile",
                colorArrowIcon: Colors.black,
                colorText: Colors.black,
              ),
              SizedBox(height: 20.h),
              ProfileImageWithIcon(
                imageFile: pickedImage,
                onTap: onPickImage,
              ),
              SizedBox(height: 5.h),
              const ProfileUserInfoTexts(),
              SizedBox(height: 15.h),
            ],
          ),
        ),
        Positioned(
          bottom: -5.h,
          left: 0,
          right: 0,
          child: const ProfileInfoCardSection(),
        ),
      ],
    );
  }
}


















// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/profile_image_widget.dart';
// import 'package:profile_app/core/Widget%20reuse/custom_text_and_icon_arrowBack.dart';
// import 'package:profile_app/Features/Profile%20User/presentation/views/Widgets/info_card_widget.dart';
// import 'package:profile_app/const.dart';

// class ProfileHeaderWidget extends StatefulWidget {
  

//   const ProfileHeaderWidget({
//     Key? key,
//      File? pickedImage, required Future<void> Function() onPickImage,
//   }) : super(key: key);

//   @override
//   State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
// }

// class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
//   File? _pickedImage;

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image =
//         await picker.pickImage(source: ImageSource.gallery); // أو camera

//     if (image != null) {
//       setState(() {
//         _pickedImage = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           width: double.infinity,
//           height: 291,
//           padding: EdgeInsets.all(12.w),
//           margin: EdgeInsets.only(bottom: 30.h),
//           decoration: const BoxDecoration(
//             color: kPrimaryColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 4,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const CustomTextAndIconArrowback(
//                 text: "My Profile",
//                 colorArrowIcon: Colors.black,
//                 colorText: Colors.black,
//               ),
//               SizedBox(height: 20.h),
//               ProfileImage(
//                 imageFile: _pickedImage ,
//                 onTap: _pickImage,
//               ),
              
//               SizedBox(height: 5.h),
//               Text(
               
//                      'Full Name',
//                 style: TextStyle(
//                   fontSize: 23.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
                
//                      'email@example.com',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: secondaryColor,
//                 ),
//               ),
//               Text(
//                 "Birthday: Jan 1st",
//                 style: TextStyle(
//                   fontSize: 12.sp,
//                   color: secondaryColor,
//                 ),
//               ),
//               SizedBox(height: 15.h),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: -5.h,
//           left: 0,
//           right: 0,
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16),
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
//                 decoration: BoxDecoration(
//                   color: accentColor,
//                   borderRadius: BorderRadius.circular(12.r),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: InfoCardWidget(
//                         title: "Weight",
//                         value:'15 kg',
//                       ),
//                     ),
//                     SizedBox(width: 1.w, child: Container(color: Colors.white ,width: 2,height: 50,)),
//                     Expanded(
//                       child: InfoCardWidget(
//                         title: "Years Old",
//                         value:'23',
//                       ),
//                     ),
//                     SizedBox(width: 1.w, child: Container(color: Colors.white ,width: 2,height: 50,)),
//                     Expanded(
//                       child: InfoCardWidget(
//                         title: "Height",
//                         value:'162 CM',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
