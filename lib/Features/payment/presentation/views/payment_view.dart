import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/payment/data/repo/strip_repo_impl.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_cubit.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/payment_view_body.dart';
import 'package:sehatak/core/utils/api_service.dart';

/// View for initiating a payment through Stripe
class PaymentView extends StatelessWidget {
  final String priceFromApi;
  final String id;

  const PaymentView({super.key, required this.priceFromApi, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StripeCubit(
        StripeRepoImpl(ApiService(Dio())),
      ),
      child: Scaffold(
        body: PaymentViewBody(
          priceFromApi: priceFromApi,
          id: id,
        ),
      ),
    );
  }
}
