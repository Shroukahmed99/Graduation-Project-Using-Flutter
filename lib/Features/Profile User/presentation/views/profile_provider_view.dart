import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Update%20Provider%20Profile/update_provider_profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_provider_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class ProfileProviderView extends StatelessWidget {
  const ProfileProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Creating UpdateProviderProfileCubit with proper dependency injection
        BlocProvider(
          create: (context) => UpdateProviderProfileCubit(ProfileRepositoryImpl(ApiService(Dio()))),
        ),
        BlocProvider(create: (_) => ProfileImageCubit()),
        // Creating ProfileProviderCubit with the necessary dependencies
        BlocProvider(
          create: (_) => ProfileProviderCubit(ProfileRepositoryImpl(ApiService(Dio())))..getProviderData(),
        ),
      ],
      child:const Scaffold(
        body: SafeArea(child: ProfileProviderBody()),
        bottomNavigationBar: const CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}
