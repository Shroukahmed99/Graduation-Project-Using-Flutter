import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/home%20service/presentation/manger/select_customer/home_service_tab_cubit_cubit.dart';
import 'package:sehatak/const.dart';

class SelectCustomersTab extends StatelessWidget {
  const SelectCustomersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final showNew = context.watch<HomeServiceTabCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.read<HomeServiceTabCubit>().showCustomers(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
              decoration: BoxDecoration(
                color: !showNew ? kPrimaryColor : accentColor,
                borderRadius: BorderRadius.circular(23),
              ),
              child: const Text(
                "custmers",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () =>
                    context.read<HomeServiceTabCubit>().showNewCustomers(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: showNew ? kPrimaryColor : accentColor,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: const Text(
                    "new custemrs",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              const Positioned(
                top: -10,
                right: -8,
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
