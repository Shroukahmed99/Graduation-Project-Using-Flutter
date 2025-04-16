import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/navigation/navigation_cubit.dart';

class IconNavigationBottom extends StatelessWidget {
  final String imagePath;
  final int index;
  final bool isSelected;
  final VoidCallback? onTap;

  const IconNavigationBottom({
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
        width: 35,
        height: 25,
        color: isSelected ? Colors.black : Colors.white,
      ),
    );
  }
}