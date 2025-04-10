import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/data/models/more_nutrition_model.dart';
import 'package:sehatak/const.dart';

class InfoDataNutrition extends StatelessWidget {
  const InfoDataNutrition({super.key, required this.nutritionistMore});
  final NutritionistMore nutritionistMore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryColor, width: 3),
                ),
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nutritionistMore.fullName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(nutritionistMore.job,
                      style: const TextStyle(color: accentColor)),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 150,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image 19.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("COST", style: TextStyle(color: kPrimaryColor)),
                    Text("E£ ${nutritionistMore.priceRange} EGP",
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image 18.png',
                  width: 20,
                  height: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HAPPY", style: TextStyle(color: kPrimaryColor)),
                    Text("500+ ratings", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          const Text("Bio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            nutritionistMore.bio,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
