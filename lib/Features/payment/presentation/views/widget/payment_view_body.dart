import 'package:flutter/material.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';
import 'package:sehatak/const.dart';

class PaymentViewBody extends StatelessWidget {
  final String priceFromApi;

  const PaymentViewBody({super.key, required this.priceFromApi});

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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'BOOK NOW',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  final pkg = packages[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 150,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            pkg['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            pkg['price']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            pkg['duration']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const CustomButtomBookNow(
                            colorText: Colors.black,
                            fontSize: 11,
                            height: 20,
                            width: 70,
                            color: Colors.white,
                            text: 'BOOK NOW',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 70),
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
              child: const TextField(
                maxLines: 5,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Add text...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 130),
            const CustomButtomBookNow(
              text: 'BOOK NOW',
            ),
          ],
        ),
      ),
    );
  }
}
