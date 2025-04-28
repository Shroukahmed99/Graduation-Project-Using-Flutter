import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/newCustmer/new_custmer_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_new_custmers.dart';

class CustomNewCustmersListView extends StatelessWidget {
  const CustomNewCustmersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewCustmerCubit, NewCustmerState>(
      builder: (context, state) {
        if (state is NewCustmerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewCustmerFaliure) {
          return Center(child: Text(state.message));
        } else if (state is NewCustmerSuccess) {
          final customers = state.data;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              return CustomNewCustmers(data: customers[index]);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
