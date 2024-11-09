import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sehatak/const.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 25.47,
                    fontWeight: FontWeight.w700,
                    color: backgroundColor,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .moveY(begin: -30, end: 0),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Health',
                      style: TextStyle(
                        fontSize: 54.04,
                        fontWeight: FontWeight.w800,
                        color: kPrimaryColor,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 1.seconds)
                        .moveX(begin: -30, end: 0),
                    const SizedBox(width: 5),
                    const Text(
                      'Mate',
                      style: TextStyle(
                        fontSize: 54.04,
                        fontWeight: FontWeight.w800,
                        color: backgroundColor,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 2.seconds)
                        .moveX(begin: 30, end: 0),
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
