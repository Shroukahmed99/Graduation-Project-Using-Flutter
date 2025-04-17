import 'package:flutter/material.dart';
import 'package:sehatak/Features/articles/presentation/views/widget/articles_list_view.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';
import 'package:sehatak/const.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomAppBarHome(title: 'Articles'),
            ArticleInputCard(),
            SizedBox(height: 20),
            Text('data'),
            ArticlesListView(),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage('assets/images/3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Positioned(
              top: 8,
              left: 8,
              child: Text(
                "HOW CAN I WWWWW ?",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 8,
              child: Text(
                "Incorporating Physical\nExercise Into Your Daily\nRoutine Can Boost...",
                style: TextStyle(
                  color: Color(0xffFAF3E1),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleInputCard extends StatelessWidget {
  const ArticleInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20),
              SizedBox(width: 8),
              Text(
                "MOHAMED KHALED",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text("Enter Text . . .",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
          SizedBox(height: 4),
          Text("Enter Details . . . . . . . . . .",
              style: TextStyle(color: accentColor)),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.image, color: kPrimaryColor),
              Spacer(),
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                child: Text("Share", style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
