import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_cubit.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_state.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/goal_input_payment.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/packeg_list_payment.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentViewBody extends StatelessWidget {
  final String priceFromApi;
  final String id;

  PaymentViewBody({
    super.key,
    required this.priceFromApi,
    required this.id,
  });

  final TextEditingController goalController = TextEditingController();

  final List<Map<String, String>> packages = [];

  void _launchCheckoutUrl(BuildContext context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      customSnackBar(context, 'Could not launch checkout page');
    }
  }

  void _bookNow(BuildContext context, StripeState state) {
    final goal = goalController.text.trim();

    if (goal.isEmpty || state is! StripePackageSelected) {
      customSnackBar(context,
          'Please select a package and enter your goal before proceeding.');
      return;
    }

    BlocProvider.of<StripeCubit>(context).createStripeSession(
      id,
      goal: goal,
      duration: state.selectedDuration,
      price: state.selectedPrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    packages.addAll([
      {
        'title': 'Starter Plan',
        'price': priceFromApi,
        'duration': '1 Month Access',
      },
      {
        'title': 'Standard Plan',
        'price': (int.parse(priceFromApi) * 2).toString(),
        'duration': '3 Months Access',
      },
      {
        'title': 'Premium Plan',
        'price': (int.parse(priceFromApi) * 6).toString(),
        'duration': '6 Months Access',
      },
      {
        'title': 'Annual Plan',
        'price': (int.parse(priceFromApi) * 12).toString(),
        'duration': '1 Year Access',
      },
    ]);

    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {
        if (state is StripeFailure) {
          customSnackBar(context, 'Error: ${state.errorMessage}');
        } else if (state is StripeSuccess) {
          _launchCheckoutUrl(context, state.checkoutSession.url);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 30),
                PackageListWidget(
                  packages: packages,
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What\'s Your Goal?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                GoalInputWidget(
                  controller: goalController,
                ),
                const SizedBox(height: 60),
                CustomButtomBookNow(
                  text: state is StripeLoading ? 'Processing...' : 'BOOK NOW',
                  onTap: () => _bookNow(context, state),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
