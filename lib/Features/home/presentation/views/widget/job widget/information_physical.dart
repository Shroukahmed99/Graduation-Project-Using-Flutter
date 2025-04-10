import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/data/models/physical_model.dart';
import 'package:sehatak/const.dart';

class InformationPhysical extends StatelessWidget {
  final PhysicalTherapModel physical;

  const InformationPhysical({super.key, required this.physical});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xff222222),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      physical.fullName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF9F5B),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/images/3.png', // يمكنك لاحقًا تغييرها إلى صورة من النت أو من API
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    physical.bio,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/image 19.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("COST",
                                style: TextStyle(color: Colors.white)),
                            Text("E£ ${physical.priceRange} EGP",
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/image 18.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HAPPY",
                                style: TextStyle(color: Colors.white70)),
                            Text("500+ ratings",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/physical/${physical.id}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "MORE...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
