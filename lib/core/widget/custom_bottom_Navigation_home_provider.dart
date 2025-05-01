import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/presentation/manger/navigation/navigation_cubit.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/icon_navigation_bottom.dart';

class CustomBottomNavigationHomeProvider extends StatelessWidget {
  const CustomBottomNavigationHomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
            height: 55,
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconNavigationBottom(
                  imagePath: 'assets/images/homenav.png',
                  index: 0,
                  isSelected: state == 0,
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kHomeProviderView);
                  },
                ),
                IconNavigationBottom(
                  imagePath: 'assets/images/si_library-books-fill.png',
                  index: 2,
                  isSelected: state == 2,
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kArticlesView);
                  },
                ),
                IconNavigationBottom(
                  imagePath: 'assets/images/settingnav.png',
                  index: 3,
                  isSelected: state == 3,
                  onTap: () {
                    GoRouter.of(context)
                        .go(AppRouter.kSettingProfileProviderView);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
