import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/what%20goal%20cubit/goal_cubit.dart';
import 'package:sehatak/const.dart';

class CustomSelectGoal extends StatelessWidget {
  final List<String> options;
  final String? selectedOption; // ✅ إضافة معامل جديد
  final Function(String) onSelect; // ✅ تمرير دالة عند الاختيار

  const CustomSelectGoal({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });

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
          children: List.generate(options.length, (index) {
            return GestureDetector(
              onTap: () {
                onSelect(options[index]); // ✅ استدعاء الدالة عند الاختيار
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
                      options[index],
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
                        color: selectedOption ==
                                options[index] // ✅ استخدام المتغير الجديد
                            ? Colors.orange
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
