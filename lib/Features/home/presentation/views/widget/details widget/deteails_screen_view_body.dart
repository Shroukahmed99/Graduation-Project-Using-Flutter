import 'package:flutter/widgets.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/doctor_info.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section.dart';

class DeteailsScreenViewBody extends StatelessWidget {
  const DeteailsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarDetails(
          title: 'Nutrition',
          image: 'assets/images/category2.png',
        ),
        SizedBox(height: 20),
        DoctorInfo(),
        FeedbackSection(),
        SizedBox(height: 40),
        CustomButtomBookNow(text: 'BOOK NOW')
      ],
    );
  }
}
