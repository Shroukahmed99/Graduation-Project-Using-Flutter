import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/presentation/manger/top%20rating/top_rating_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/top_rating.dart';

class TopRatingListView extends StatelessWidget {
  const TopRatingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TopRatingCubit, TopRatingState>(
          builder: (context, state) {
            if (state is TopRatingLoding) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopRatingFailure) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is TopRatingSuccess) {
              final providers = state.providers;
              return Row(
                children: List.generate(providers.length, (index) {
                  final provider = providers[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: TopRating(provider: provider),
                  );
                }),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
