import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart'; // قم بإضافة استيراد الـ Cubit
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/display_provider_profile_details_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';

class DisplayProviderProfileDetailsView extends StatelessWidget {
  const DisplayProviderProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // توفير ProfileProviderCubit
        BlocProvider(
          create: (_) => ProfileProviderCubit(ProfileRepositoryImpl(ApiService(Dio())))
            ..getProviderData(),
        ),
        // توفير ProfileImageCubit
        BlocProvider(
          create: (_) => ProfileImageCubit(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: DisplayProviderProfileDetailsBody()),
        bottomNavigationBar: CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}
