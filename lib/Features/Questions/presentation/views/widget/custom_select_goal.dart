import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/what%20goal%20cubit/goal_cubit.dart';
import 'package:sehatak/const.dart';

class CustomSelectGoal extends StatelessWidget {
  final List<String> options;

  const CustomSelectGoal({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 400,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: BlocBuilder<GoalCubit, GoalState>(
          builder: (context, state) {
            String selectedGoal = (state is GoalSelected) ? state.goal : "";

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(options.length, (index) {
                return GestureDetector(
                  onTap: () {
                    context.read<GoalCubit>().selectGoal(options[index]);
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
                            color: selectedGoal == options[index]
                                ? Colors.orange
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
