import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home/data/repo/home_repo_impl.dart';
import 'package:sehatak/Features/home/presentation/manger/physical%20more/physical_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/details_physical_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

class DetailsPhysicalView extends StatelessWidget {
  final String id;

  const DetailsPhysicalView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhysicalMoreCubit(HomeRepoImpl(ApiService(Dio())))
        ..fetchPhysicalistById(id),
      child: Scaffold(
        body: DetailsPhysicalViewBody(
          physicalId: id,
        ),
      ),
    );
  }
}
