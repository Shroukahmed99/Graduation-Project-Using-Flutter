import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sehatak/const.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 24, left: 24),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: accentColor,
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: accentColor,
              Icons.notifications,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
