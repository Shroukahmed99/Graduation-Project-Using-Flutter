import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Community/presentation/manger/AddPost/add_post_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/const.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPostCubit>();

    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          cubit.clearAll();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Post added successfully!'),
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: BlocBuilder<SaveNameCubit, SaveNameState>(
            builder: (context, state) {
              if (state is SaveNameClientLoaded) {
                final name = " ${state.client.fullName.split(' ')[0]}";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: cubit.contentController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Enter Text...",
                        hintStyle: TextStyle(color: accentColor),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: accentColor),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.pickImage();
                          },
                          child: const Icon(
                            Icons.image,
                            color: kPrimaryColor,
                            size: 34,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            cubit.submitpost();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(kPrimaryColor),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                              SizedBox(width: 6.w),
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AddPostCubit, AddPostState>(
                      builder: (context, state) {
                        final file = cubit.selectedImage;
                        if (file != null) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                file,
                                height: 150.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    BlocBuilder<AddPostCubit, AddPostState>(
                      builder: (context, state) {
                        if (state is AddPostLoading) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.0.h),
                            child: const LinearProgressIndicator(),
                          );
                        } else if (state is AddPostFailure) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              "❌ ${state.message}",
                              style: const TextStyle(color: kPrimaryColor),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
