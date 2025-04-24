import 'package:flutter/material.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_custmers_list_view.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/widget/custom_stack_honty.dart';
import 'package:sehatak/features/home/presentation/views/widget/home%20widget/custom_app_bar_home.dart';

class HomeServiceViewBody extends StatelessWidget {
  const HomeServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomAppBarHome(
          title: 'Hi, Mohamed',
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "It's time to challenge your limits.",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          height: 28,
        ),
        SelectCustmersRequest(),
        SizedBox(
          height: 24,
        ),
        Expanded(child: CustomCustmersListView()),
      ],
    );
  }
}

class SelectCustmersRequest extends StatelessWidget {
  final Color color;
  const SelectCustmersRequest({super.key, this.color = accentColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: const Text(
              "custmers",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 60),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: const Text(
                  "new custemrs",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: -10,
                right: -8,
                child: ClipPath(
                  clipper: CustomStackHonty(),
                  child: Container(
                    height: 16,
                    width: 16,
                    color: color,
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
