import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class InformationWorkout extends StatelessWidget {
  const InformationWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xff222222),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "D/Bamsi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF9F5B),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/images/3.png',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Incorporating physical \nexercise into your daily\nroutine can boost...",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/image 19.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("COST", style: TextStyle(color: Colors.white)),
                            Text("\$ 0.80/min",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/image 18.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HAPPY",
                                style: TextStyle(color: Colors.white70)),
                            Text("500+ ratings",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "MORE...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
