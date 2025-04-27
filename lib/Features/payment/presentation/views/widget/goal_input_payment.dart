import 'package:flutter/material.dart';

class GoalInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const GoalInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          hintText: 'Add text...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
