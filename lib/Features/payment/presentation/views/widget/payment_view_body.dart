import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        'duration': '1',
        'label': '1 Month Access',
      },
      {
        'title': 'Standard Plan',
        'price': (int.parse(priceFromApi) * 2).toString(),
        'duration': '3',
        'label': '3 Months Access',
      },
      {
        'title': 'Premium Plan',
        'price': (int.parse(priceFromApi) * 6).toString(),
        'duration': '6',
        'label': '6 Months Access',
      },
      {
        'title': 'Annual Plan',
        'price': (int.parse(priceFromApi) * 12).toString(),
        'duration': '12',
        'label': '1 Year Access',
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
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Text(
                  'BOOK NOW',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                SizedBox(height: 30.h),
                PackageListWidget(
                  packages: packages,
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What\'s Your Goal?',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                GoalInputWidget(
                  controller: goalController,
                ),
                SizedBox(height: 70.h),
                CustomButtomBookNow(
                  text: state is StripeLoading ? 'Processing...' : 'BOOK NOW',
                  onTap: () => _bookNow(context, state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
