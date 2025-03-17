import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:sehatak/const.dart';

class ProfileImage extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const ProfileImage({
    super.key,
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.grey[300],
          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
          child: imageFile == null
              ? Icon(Icons.person, size: 50.r, color: Colors.grey)
              : null,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: accentColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.r),
            child: Icon(
              Icons.edit,
              color: Colors.black,
              size: 16.r,
            ),
          ),
        ),
      ],
    );
  }
}
