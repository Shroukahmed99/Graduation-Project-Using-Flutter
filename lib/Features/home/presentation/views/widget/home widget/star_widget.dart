import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({super.key});

  @override
  _StarWidgetState createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Icon(
        isFavorite ? FontAwesomeIcons.solidStar : FontAwesomeIcons.solidStar,
        color: isFavorite ? const Color(0xffFCD53F) : Colors.white,
        size: 15,
      ),
    );
  }
}
