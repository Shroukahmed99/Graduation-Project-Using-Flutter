import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/insert_data_view_body.dart';

class InsertDataView extends StatelessWidget {
  const InsertDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsertDataCubit(),
      child: const Scaffold(
        body: InsertDataViewBody(),
      ),
    );
  }
}
