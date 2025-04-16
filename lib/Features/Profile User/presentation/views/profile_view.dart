// profile_view.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/profile_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_client.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileImageCubit()),
        BlocProvider(
          create: (_) => ProfileClientCubit(ProfileRepositoryImpl(ApiService(Dio())))..getClientData(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: ProfileBody()),
        bottomNavigationBar: CustomBottomNavigationHomeClient(),
      ),
    );
  }
}