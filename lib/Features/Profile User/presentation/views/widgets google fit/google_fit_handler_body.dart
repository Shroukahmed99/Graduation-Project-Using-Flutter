import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_state.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleFitHandlerBody extends StatefulWidget {
  const GoogleFitHandlerBody({super.key});

  @override
  State<GoogleFitHandlerBody> createState() => _GoogleFitHandlerPageState();
}

class _GoogleFitHandlerPageState extends State<GoogleFitHandlerBody>
    with WidgetsBindingObserver {
  late FitnessCubit fitnessCubit;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    fitnessCubit = context.read<FitnessCubit>();
    fitnessCubit.getFitnessData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      fitnessCubit.refreshFitnessData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessCubit, FitnessState>(
      listener: (context, state) {
        print(state);
        if (state is FitnessFailure) {
          // fitnessCubit.getAuthUrl();
        }
        if (state is FitnessLoaded) {
          // _launchGoogleFitUrl(state.url);
        }
        if (state is FitnessDataLoaded) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(builder: (_) => const FitnessLinkView()),
          //   );
          // });
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void _launchGoogleFitUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch Google Fit URL');
    }
  }
}
