import 'package:flutter/material.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 255),
        child: Center(
          child: Container(
            width: 211,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 8),
                  spreadRadius: 3,
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
