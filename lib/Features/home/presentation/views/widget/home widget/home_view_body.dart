import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/category_item.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_articles.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_rating_section.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/recommendations_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const CustomAppBarHome(),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "It's time to challenge your limits.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
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
                      height: 50,
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
                      height: 50,
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
              const SizedBox(height: 10),
              const RecommendationsSection(),
              const SizedBox(height: 15),
              const RatingSection(),
              const ArticlesSection(),
              const SizedBox(height: 100),
            ],
          ),
        ),
        CustomBottomNavigationHomeClient(),
      ],
    );
  }
}
