import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomStorBy extends StatelessWidget {
  const CustomStorBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56, right: 35),
      child: Row(
        children: [
          const Text(
            "Sort By",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: accentColor),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Price",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Rating",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "All",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
