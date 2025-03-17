import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20cubit/profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/profile_body.dart';
import 'package:sehatak/core/widget/bottom_navigation_bar.dart';
import 'package:sehatak/core/widget/custom_bottom_home.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const Scaffold(
        body: SafeArea(child: ProfileBody()),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
