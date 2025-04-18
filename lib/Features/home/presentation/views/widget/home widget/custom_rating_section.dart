import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/top_rating_list_view.dart';
import 'package:sehatak/const.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 393,
      color: kPrimaryColor,
      child: const Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "TOP RATING",
                style: TextStyle(
                  fontFamily: 'Radio Canada Big',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          TopRatingListView(),
        ],
      ),
    );
  }
}
