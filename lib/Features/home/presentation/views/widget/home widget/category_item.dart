import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String? title;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.imagePath,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
            color: kPrimaryColor,
          ),
          Text(
            title!,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
