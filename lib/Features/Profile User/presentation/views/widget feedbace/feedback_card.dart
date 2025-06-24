import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class FeedbackCard extends StatelessWidget {
  final String name;
  final String feedbackText;
  final int rating;

  const FeedbackCard({
    super.key,
    required this.name,
    required this.feedbackText,
    this.rating = 3, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.message, size: 20, color: Colors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  feedbackText,
                  style: const TextStyle(fontSize: 13),
                  maxLines: 3, 
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image.asset(
                    index < rating
                        ? IconPaths.selectStar
                        : IconPaths.star, 
                    width: 16, 
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
