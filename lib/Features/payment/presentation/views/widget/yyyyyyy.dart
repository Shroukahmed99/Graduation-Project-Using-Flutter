// class PaymentViewBody extends StatelessWidget {
//   final String priceFromApi;

//   const PaymentViewBody({super.key, required this.priceFromApi});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> packages = [
//       {
//         'title': 'Starter Plan',
//         'price': priceFromApi,
//         'duration': '1 Month Access',
//       },
//       {
//         'title': 'Standard Plan',
//         'price': (int.parse(priceFromApi) * 2).toString(),
//         'duration': '3 Months Access',
//       },
//       {
//         'title': 'Premium Plan',
//         'price': (int.parse(priceFromApi) * 6).toString(),
//         'duration': '6 Months Access',
//       },
//       {
//         'title': 'Annual Plan',
//         'price': (int.parse(priceFromApi) * 12).toString(),
//         'duration': '1 Year Access',
//       },
//     ];

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           children: [
//             const SizedBox(height: 30),
//             const Text(
//               'BOOK NOW',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: accentColor,
//               ),
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//               height: 300,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: packages.length,
//                 itemBuilder: (context, index) {
//                   final pkg = packages[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: 190,
//                           decoration: BoxDecoration(
//                             color: kPrimaryColor,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   pkg['title']!,
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 14),
//                                 Text(
//                                   "\$${pkg['price']!}",
//                                   style: const TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 14),
//                                 Text(
//                                   pkg['duration']!,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 14),
//                                 const FeatureItem(text: "Customized Plan"),
//                                 const SizedBox(height: 3),
//                                 const FeatureItem(
//                                     text: "Chat for communication"),
//                                 const SizedBox(height: 3),
//                                 const FeatureItem(text: "Important Advices"),
//                                 const SizedBox(height: 3),
//                                 const FeatureItem(text: "continuous follow-up"),
//                                 const Spacer(),
//                                 const Center(
//                                   child: CustomButtomBookNow(
//                                     colorText: Colors.black,
//                                     fontSize: 11,
//                                     height: 30,
//                                     width: 70,
//                                     color: Colors.white,
//                                     text: 'CHOOSE  ',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 15,
//                           right: -18,
//                           child: Transform.rotate(
//                             angle: 0.785398,
//                             child: Container(
//                               color: Colors.black,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 1, horizontal: 20),
//                               child: const Text(
//                                 'Best Offer',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Whats Your Goals ?',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   color: Colors.white,
//                 ),
//               ),
//               child: const TextField(
//                 maxLines: 5,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Add text...',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 60),
//             const CustomButtomBookNow(
//               text: 'BOOK NOW',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
