import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/rating_nutrion.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/rating_physical_therapy.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/rating_work_out.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 393,
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Text(
                "Rating",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                RatingNutraion(),
                SizedBox(width: 20),
                RatingWorkOut(),
                SizedBox(width: 20),
                RatingPhysicalTherapy(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
