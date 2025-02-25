import 'package:flutter/material.dart';
import 'package:sehatak/const.dart';

class CustomSelectGoal extends StatefulWidget {
  final List<String> options;
  const CustomSelectGoal({super.key, required this.options});

  @override
  _CustomSelectGoalState createState() => _CustomSelectGoalState();
}

class _CustomSelectGoalState extends State<CustomSelectGoal> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(widget.options.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        widget.options[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                          color: selectedIndex == index
                              ? Colors.orange
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
