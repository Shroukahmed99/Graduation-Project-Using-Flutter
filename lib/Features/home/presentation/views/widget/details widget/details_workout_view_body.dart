import 'package:flutter/widgets.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_workout.dart';

class DeteailsWorkoutViewBody extends StatelessWidget {
  const DeteailsWorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarDetails(
          title: 'work out',
          image: 'assets/images/catgory1.png',
        ),
        SizedBox(height: 20),
        InfoDataWorkout(),
        FeedbackSection(),
        SizedBox(height: 40),
        CustomButtomBookNow(text: 'BOOK NOW')
      ],
    );
  }
}
