import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/physical%20therap/physical_therap_cubit.dart';
import 'package:sehatak/features/home/presentation/views/widget/job%20widget/information_physical.dart';

class PhysicalListView extends StatelessWidget {
  const PhysicalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhysicalTherapCubit, PhysicalTherapState>(
      builder: (context, state) {
        if (state is PhysicalTherapLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhysicalTherapFailure) {
          return Center(child: Text("Error: ${state.message}"));
        } else if (state is PhysicalTherapSuccess) {
          final physicalTherapists = state.physicalTherapists;
          return ListView.builder(
            itemCount: physicalTherapists.length,
            itemBuilder: (context, index) {
              final physicalTherapist = physicalTherapists[index];
              return InformationPhysical(physical: physicalTherapist);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
