import 'package:flutter/material.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/information_physical.dart';

class PhysicalListView extends StatelessWidget {
  const PhysicalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const InformationPhysical();
      },
    );
  }
}
