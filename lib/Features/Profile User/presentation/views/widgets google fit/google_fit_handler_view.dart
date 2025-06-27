import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'google_fit_handler_body.dart';

class GoogleFitHandlerView extends StatelessWidget {
  const GoogleFitHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ProfileRepositoryImpl(ApiService(Dio()));

    return MultiBlocProvider(
      providers: [
        BlocProvider<FitnessCubit>(
          create: (_) => FitnessCubit(profileRepository: repo),
        ),
        BlocProvider<ProfileImageCubit>(
          create: (_) => ProfileImageCubit()..loadSavedImage(),
        ),
        BlocProvider<SaveNameCubit>(
          create: (_) => SaveNameCubit(repo)..fetchClientProfile(),
        ),
      ],
      child: const GoogleFitHandlerBody(),
    );
  }
}
