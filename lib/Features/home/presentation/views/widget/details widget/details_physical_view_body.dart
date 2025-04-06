import 'package:flutter/material.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_physical.dart';

class DetailsPhysicalViewBody extends StatelessWidget {
  const DetailsPhysicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarDetails(
          title: ' physical therapy',
          image: 'assets/images/category3.png',
        ),
        SizedBox(height: 20),
        InfoDataPhysical(),
        FeedbackSection(),
        SizedBox(height: 40),
        CustomButtomBookNow(text: 'BOOK NOW')
      ],
    );
  }
}
