import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/custom_app_bar_home_client.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/category_item.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_articles.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_rating_section.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/recommendations_section.dart';

class HomeViewClientBody extends StatelessWidget {
  const HomeViewClientBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: screenHeight * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.only(left: screenWidth * 0.06),
            child: Text(
              "It's time to challenge your limits.",
              style: TextStyle(fontSize: screenWidth * 0.035),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
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
                  width: 1,
                  height: screenHeight * 0.06,
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
                  width: 1,
                  height: screenHeight * 0.06,
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
          SizedBox(height: screenHeight * 0.03),
          const RecommendationsSection(),
          SizedBox(height: screenHeight * 0.03),
          const RatingSection(),
          SizedBox(height: screenHeight * 0.02),
          const ArticlesSection(),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
