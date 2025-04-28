import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/custmer/custmer_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_custmers.dart';

class CustomCustmersListView extends StatelessWidget {
  const CustomCustmersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustmerCubit, CustmerState>(
      builder: (context, state) {
        if (state is CustmerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CustmerFaliure) {
          return Center(child: Text(state.message));
        } else if (state is CustmerSuccess) {
          final customers = state.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              return CustomCustmers(data: customers[index]);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
