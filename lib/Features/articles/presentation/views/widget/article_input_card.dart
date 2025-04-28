import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/articles/presentation/manger/addArticle/add_article_cubit.dart';
import 'package:sehatak/const.dart';

class ArticleInputCard extends StatelessWidget {
  const ArticleInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddArticleCubit>();

    return BlocListener<AddArticleCubit, AddArticleState>(
      listener: (context, state) {
        if (state is AddArticleSuccess) {
          cubit.clearAll();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('✅ Article added successfully!'),
                backgroundColor: kPrimaryColor),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(radius: 20),
                  SizedBox(width: 8),
                  Text(
                    "MOHAMED KHALED",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: cubit.titleController,
                decoration: const InputDecoration(
                  hintText: "Enter Text . . .",
                  hintStyle: TextStyle(color: kPrimaryColor),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              TextField(
                controller: cubit.contentController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Enter details...",
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
                      cubit.submitArticle("SERVICE_PROVIDER_ID");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Share",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 6.w),
                        Icon(Icons.check, color: Colors.white, size: 20.sp),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              BlocBuilder<AddArticleCubit, AddArticleState>(
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
              BlocBuilder<AddArticleCubit, AddArticleState>(
                builder: (context, state) {
                  if (state is AddArticleLoading) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.0.h),
                      child: const LinearProgressIndicator(),
                    );
                  } else if (state is AddArticleFailure) {
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
          ),
        ),
      ),
    );
  }
}
