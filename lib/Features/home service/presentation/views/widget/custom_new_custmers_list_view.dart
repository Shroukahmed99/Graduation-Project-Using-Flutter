import 'package:flutter/material.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_new_custmers.dart';

class CustomNewCustmersListView extends StatelessWidget {
  const CustomNewCustmersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomNewCustmers();
      },
    );
  }
}
