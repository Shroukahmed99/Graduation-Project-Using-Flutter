import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/image_details_page.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/star_widget.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ArticleDetailsPage(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 157,
            height: 134,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage("assets/images/3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 8,
          right: 20,
          child: StarWidget(),
        ),
      ],
    );
  }
}
