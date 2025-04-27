import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_cubit.dart';
import 'package:sehatak/Features/payment/presentation/manger/strip/strip_state.dart';
import 'package:sehatak/Features/payment/presentation/views/widget/feature_item.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';

class PackageListWidget extends StatelessWidget {
  final List<Map<String, String>> packages;

  const PackageListWidget({Key? key, required this.packages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StripeCubit, StripeState>(
      builder: (context, state) {
        int? selectedIndex;
        if (state is StripePackageSelected) {
          selectedIndex = state.selectedIndex;
        }

        return SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final pkg = packages[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  BlocProvider.of<StripeCubit>(context).selectPackage(
                    selectedIndex: index,
                    selectedPrice: pkg['price']!,
                    selectedDuration: pkg['duration']!,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Stack(
                    children: [
                      Container(
                        width: 190,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
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
                              const SizedBox(height: 14),
                              const FeatureItem(text: "Customized Plan"),
                              const SizedBox(height: 3),
                              const FeatureItem(text: "Chat for communication"),
                              const SizedBox(height: 3),
                              const FeatureItem(text: "Important Advices"),
                              const SizedBox(height: 3),
                              const FeatureItem(text: "Continuous follow-up"),
                              const Spacer(),
                              Center(
                                child: isSelected
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : const CustomButtomBookNow(
                                        colorText: Colors.black,
                                        fontSize: 11,
                                        height: 30,
                                        width: 70,
                                        color: Colors.white,
                                        text: 'CHOOSE',
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: -18,
                        child: Transform.rotate(
                          angle: 0.785398, // 45 degrees
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 20),
                            child: const Text(
                              'Best Offer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
