import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehatak/const.dart';

class ProfileImageWithIcon extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const ProfileImageWithIcon({
    Key? key,
    required this.imageFile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: imageFile != null
              ? FileImage(imageFile!)
              : const AssetImage('assets/images/1.png') as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 4.w,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor,
              ),
              padding: EdgeInsets.all(6.r),
              child: Image.asset(IconPaths.editIcon,
                width: 18.r,
                height: 18.r,
                
              ),
            ),
          ),
        ),
      ],
    );
  }
}
