// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sehatak/Features/home/presentation/manger/navigation/navigation_cubit.dart';
// import 'package:sehatak/const.dart';
// import 'package:sehatak/core/utils/app_router.dart';
// import 'package:sehatak/core/widget/Bottom_navigation_icon.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NavigationCubit, int>(
//       builder: (context, state) {
//         return ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//           ),
//           child: Container(
//             height: 55,
//             color: kPrimaryColor,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 BottomNavigationIcon(
//                   icon: Icons.home,
//                   index: 0,
//                   isSelected: state == 0,
//                 ),
//                 BottomNavigationIcon(
//                   icon: Icons.star,
//                   index: 1,
//                   isSelected: state == 1,
//                 ),
//                 BottomNavigationIcon(
//                   icon: Icons.group,
//                   index: 2,
//                   isSelected: state == 2,
//                 ),
//                 BottomNavigationIcon(
//                   icon: Icons.person,
//                   index: 3,
//                   isSelected: state == 3,
//                   onTap: () {
//                     context.read<NavigationCubit>().updateIndex(3);
//                     context.go(AppRouter.kProfileView);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
