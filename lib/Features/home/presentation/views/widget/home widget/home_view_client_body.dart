import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/custom_app_bar_home_client.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/category_item.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_articles.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_rating_section.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/recommendations_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewClientBody extends StatelessWidget {
  const HomeViewClientBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        children: [
          BlocBuilder<SaveNameCubit, SaveNameState>(
            builder: (context, state) {
              return CustomAppBarHomeClient(
                title: state is SaveNameClientLoaded
                    ? "Hi, ${state.client.fullName.split(' ')[0]}"
                    : "Hi, Loading...",
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "It's time to challenge your limits.",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryItem(
                  imagePath: 'assets/images/catgory1.png',
                  title: 'Workout',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kWorkoutView);
                  },
                ),
                Container(
                  width: 1.w,
                  height: 50.h,
                  color: kPrimaryColor,
                ),
                CategoryItem(
                  imagePath: 'assets/images/category3.png',
                  title: 'Physical Therapy',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kPhysicalView);
                  },
                ),
                Container(
                  width: 1.w,
                  height: 50.h,
                  color: kPrimaryColor,
                ),
                CategoryItem(
                  imagePath: 'assets/images/category2.png',
                  title: 'Nutrition',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kNutritionView);
                  },
                ),
              ],
            ),
          ),
          const RecommendationsSection(),
          SizedBox(height: 30.h),
          const RatingSection(),
          SizedBox(height: 20.h),
          const ArticlesSection(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
