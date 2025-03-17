import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingPhysicalTherapy extends StatelessWidget {
  const RatingPhysicalTherapy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 110,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/3.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(
              FontAwesomeIcons.solidStar,
              color: Color(0xffFCD53F),
              size: 12, // حجم مناسب للنجمة
            ),
            SizedBox(width: 5), // إضافة مسافة بين النجمة والرقم
            Text(
              "00", // مثال للتقييم
              style: TextStyle(
                fontSize: 12, // جعل الرقم أكثر وضوحًا
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
