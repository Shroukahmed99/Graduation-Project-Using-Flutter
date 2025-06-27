import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_state.dart';
import 'package:url_launcher/url_launcher.dart';

class FitnessAuthPage extends StatelessWidget {
  const FitnessAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF6E9),
      appBar: AppBar(
        title: const Text("Connect to Google Fit"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            final cubit = context.read<FitnessCubit>();
            await cubit.getAuthUrl();

            final state = cubit.state;
            if (state is FitnessLoaded) {
              final Uri uri = Uri.parse(state.url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cannot launch URL')),
                );
              }
            }
          },
          icon: const Icon(Icons.favorite, color: Colors.white),
          label: const Text('Connect with Google Fit'),
        ),
      ),
    );
  }
}
