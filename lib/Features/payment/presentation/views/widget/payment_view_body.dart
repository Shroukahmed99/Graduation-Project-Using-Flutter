import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sehatak/Features/payment/data/repo/strip_repo_impl.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';
import 'package:sehatak/const.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentViewBody extends StatelessWidget {
  final String priceFromApi;
  final String id;
  final TextEditingController goalController = TextEditingController();

  PaymentViewBody({super.key, required this.priceFromApi, required this.id});

  Future<void> _startCheckout(
      BuildContext context, String goal, String duration, String price) async {
    final repo = StripeRepoImpl(ApiService(Dio()));
    final result = await repo.createStripeSession(
      id,
      goal: goal,
      duration: duration,
      price: price,
    );

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${failure.errorMessage}')),
        );
      },
      (session) async {
        final url = 'https://checkout.stripe.com/c/${session.id}';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch checkout page')),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> packages = [
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
    ];

    String selectedPrice = packages[0]['price']!;
    String selectedDuration = packages[0]['duration']!;

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
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  final pkg = packages[index];
                  return GestureDetector(
                    onTap: () {
                      selectedPrice = pkg['price']!;
                      selectedDuration = pkg['duration']!;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Stack(
                        children: [
                          Container(
                            width: 190,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Text(
                                    pkg['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "\$${pkg['price']!}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    pkg['duration']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Center(
                                    child: Text(
                                      'Choose',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Whats Your Goals ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: TextField(
                controller: goalController,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  hintText: 'Add text...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                final goal = goalController.text.isEmpty
                    ? "No specific goal"
                    : goalController.text;
                _startCheckout(context, goal, selectedDuration, selectedPrice);
              },
              child: const Text('BOOK NOW'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/yes.png',
          width: 10,
          height: 10,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
