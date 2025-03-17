import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
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
                builder: (context) => ImageDetailsPage(
                  imageUrl: "assets/images/3.png",
                  ownerName: 'name',
                  title: 'title',
                  description: 'description',
                ),
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

class ImageDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String ownerName;
  final String title;
  final String description;

  const ImageDetailsPage({
    super.key,
    required this.imageUrl,
    required this.ownerName,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 20, // تعديل التباعد العلوي
                      right: 20, // تعديل التباعد الجانبي
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54, // لون الخلفية الشفاف
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  ownerName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
