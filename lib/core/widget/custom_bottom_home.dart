import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/features/home/presentation/manger/navigation/navigation_cubit.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;

  const NavIcon({
    Key? key,
    required this.icon,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().updateIndex(index),
      child: Icon(
        icon,
        size: 29,
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
                  icon: Icons.home,
                  index: 0,
                  isSelected: state == 0,
                ),
                NavIcon(
                  icon: Icons.star,
                  index: 1,
                  isSelected: state == 1,
                ),
                NavIcon(
                  icon: Icons.group,
                  index: 2,
                  isSelected: state == 2,
                ),
                NavIcon(
                  icon: Icons.person,
                  index: 3,
                  isSelected: state == 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
