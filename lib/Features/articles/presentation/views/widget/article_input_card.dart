import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class ArticleInputCard extends StatelessWidget {
  const ArticleInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor)),
            SizedBox(height: 4),
            Text("Enter Details . . . . . . . . . .",
                style: TextStyle(color: accentColor)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.image,
                  color: kPrimaryColor,
                  size: 34,
                ),
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
      ),
    );
  }
}
