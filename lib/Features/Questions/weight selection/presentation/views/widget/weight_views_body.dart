import 'package:flutter/material.dart';
import 'package:sehatak/Features/Questions/widgets/custom_question_and_aswer.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';

class WeightViewsBody extends StatelessWidget {
  const WeightViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 24,
      ),
      child: const Column(
        children: [
          CustomArrowBack(text: 'Back'),
          SizedBox(height: 50),
          CustomQuestionAndAswer(
              question: 'What Is Your Weight?',
              answer:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
        ],
      ),
    );
  }
}
