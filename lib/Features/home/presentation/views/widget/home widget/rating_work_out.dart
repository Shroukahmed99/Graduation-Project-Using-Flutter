// import 'package:flutter/material.dart';

// class TopRatingWorkout extends StatelessWidget {
//   const TopRatingWorkout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       decoration: BoxDecoration(
//         color: const Color(0xffFAF3E1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(24),
//                 child: Image.network(
//                   'https://storage.googleapis.com/a1aa/image/11916b46-5965-4b4e-ae61-b3e9196b726b.jpg',
//                   width: 25,
//                   height: 25,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 5),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Ahmed khaled',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'Nutrition Doctor',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 1),
//           const Divider(
//             endIndent: 50,
//             height: 1,
//             color: Color(0xFFD9D4C3),
//             thickness: 1,
//           ),
//           const SizedBox(height: 1),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RichText(
//                 text: const TextSpan(
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   children: [
//                     TextSpan(text: 'Reviews'),
//                     TextSpan(
//                       text: '102',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(9999),
//                 ),
//                 child: const Row(
//                   children: [
//                     Text(
//                       '4.2',
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(width: 1),
//                     Icon(
//                       Icons.star,
//                       color: Color(0xFFFBBF24),
//                       size: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
