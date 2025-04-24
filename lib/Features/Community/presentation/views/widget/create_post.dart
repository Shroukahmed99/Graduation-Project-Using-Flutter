import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(radius: 20),
                SizedBox(width: 8),
                Text(
                  "MOHAMED KHALED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Enter Text...",
                hintStyle: TextStyle(color: accentColor),
                border: InputBorder.none,
              ),
              style: TextStyle(color: accentColor),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.image,
                  color: kPrimaryColor,
                  size: 34,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Share", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 6),
                      Icon(Icons.check, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
