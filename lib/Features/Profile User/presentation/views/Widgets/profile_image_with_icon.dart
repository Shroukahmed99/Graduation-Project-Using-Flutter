import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/const.dart';
class ProfileImageWithIcon extends StatelessWidget {
  final String? networkImageUrl;
  final bool showEditIcon; 

  const ProfileImageWithIcon({
    Key? key,
    this.networkImageUrl,
    this.showEditIcon = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileImageCubit>().loadSavedImage();

    return BlocBuilder<ProfileImageCubit, File?>(
      builder: (context, imageFile) {
        Widget avatarContent;

        if (imageFile != null) {
          avatarContent = CircleAvatar(
            radius: 50.r,
            backgroundImage: FileImage(imageFile),
          );
        } else {
          avatarContent = CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.person,
              size: 50.r,
              color: Colors.grey,
            ),
          );
        }

        return Stack(
          children: [
            avatarContent,
            if (showEditIcon) 
              Positioned(
                bottom: 0,
                right: 4.w,
                child: GestureDetector(
                  onTap: () => context.read<ProfileImageCubit>().pickImage(),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor,
                    ),
                    padding: EdgeInsets.all(6.r),
                    child: Icon(
                      Icons.edit,
                      size: 18.r,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
