import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/presentation/manger/navigation/navigation_cubit.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';

class NavIcon extends StatelessWidget {
  final String imagePath;
  final int index;
  final bool isSelected;
  final VoidCallback? onTap;

  const NavIcon({
    Key? key,
    required this.imagePath,
    required this.index,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavigationCubit>().updateIndex(index);
        if (onTap != null) {
          onTap!();
        }
      },
      child: Image.asset(
        imagePath,
        width: 25,
        height: 25,
        color: isSelected ? Colors.black : Colors.white,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

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
                NavIcon(
                  imagePath: 'assets/images/homenav.png',
                  index: 0,
                  isSelected: state == 0,
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                ),
                NavIcon(
                  imagePath: 'assets/images/Favoritesnav.png',
                  index: 1,
                  isSelected: state == 1,
                ),
                NavIcon(
                  imagePath: 'assets/images/communitynav.png',
                  index: 2,
                  isSelected: state == 2,
                ),
                NavIcon(
                  imagePath: 'assets/images/settingnav.png',
                  index: 3,
                  isSelected: state == 3,
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kSettingProfileView);
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
