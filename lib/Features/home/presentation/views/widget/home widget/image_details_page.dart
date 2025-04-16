import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/3.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: const SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/images/3.png"),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "khaled el sayed",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        "HOW CAN I WWWWW ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exer."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exer."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exercise Into Your Daily Routine Can Boost..."
                        "Incorporating Physical Exer.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationHomeClient(),
    );
  }
}
