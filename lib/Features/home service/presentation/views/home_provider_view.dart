import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/select_customer/home_service_tab_cubit_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/home_service_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_bottom_Navigation_home_provider.dart';
import 'package:dio/dio.dart';

class HomeProviderView extends StatelessWidget {
  const HomeProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeServiceTabCubit(),
        ),
        BlocProvider(
            create: (context) =>
                SaveNameCubit(ProfileRepositoryImpl(ApiService(Dio())))
                  ..fetchProviderProfile()),
      ],
      child: const Scaffold(
        body: HomeServiceViewBody(),
        bottomNavigationBar: CustomBottomNavigationHomeProvider(),
      ),
    );
  }
}
