import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/home%20service/data/repo/home_service_repo_impl.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/custmer/custmer_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/newCustmer/new_custmer_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/select_customer/home_service_tab_cubit_cubit.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_custmers_list_view.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_new_custmers_list_view.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/select_custmers_request.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_app_bar_home.dart';

class HomeServiceViewBody extends StatelessWidget {
  const HomeServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeServiceTabCubit(),
        ),
        BlocProvider(
          create: (context) =>
              NewCustmerCubit(HomeServiceRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              CustmerCubit(HomeServiceRepoImpl(ApiService(Dio()))),
        ),
      ],
      child: const HomeServiceViewContent(),
    );
  }
}

class HomeServiceViewContent extends StatelessWidget {
  const HomeServiceViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<SaveNameCubit, SaveNameState>(
          builder: (context, state) {
            return CustomAppBarHome(
              title: state is SaveNameProviderLoaded
                  ? "Hi, ${state.provider.fullName.split(' ')[0]}"
                  : "Hi, Loading...",
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "It's time to challenge your limits.",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ),
        SizedBox(height: 28.h),
        const SelectCustomersTab(),
        SizedBox(height: 24.h),
        BlocBuilder<HomeServiceTabCubit, bool>(
          builder: (context, showNewCustomers) {
            if (showNewCustomers) {
              context.read<NewCustmerCubit>().fetchNewCustemr();
              return const CustomNewCustmersListView();
            } else {
              context.read<CustmerCubit>().fetchCustemr();
              return const CustomCustmersListView();
            }
          },
        ),
      ],
    );
  }
}
