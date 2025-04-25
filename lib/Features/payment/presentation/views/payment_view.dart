import 'package:flutter/material.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  final String priceFromApi;

  const PaymentView({super.key, required this.priceFromApi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentViewBody(priceFromApi: priceFromApi),
    );
  }
}
