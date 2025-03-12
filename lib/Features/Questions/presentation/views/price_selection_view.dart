import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/weight%20cubit/weight_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/price_selection_view_body.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20client/sign_up_client_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_cubit.dart';
import 'package:sehatak/Features/auth/data/repo/signup_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';

class PriceSelectionView extends StatelessWidget {
  const PriceSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeightCubit()),
        BlocProvider(create: (context) => SignUpProviderCubit(UsersRepoImpl(ApiService(Dio())))),
      ],
      child: const Scaffold(
        body: PriceSelectionViewBody(),
      ),
    );
  }
}
