import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/logout_bottomSheet.dart';
import 'navigation_item_widget.dart';

class ProfileSettingsList extends StatelessWidget {
  const ProfileSettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationItemWidget(
            title: "Profile",
            icon: Icons.person,
            onTap: () {},
          ),
          NavigationItemWidget(
            title: "Favorite",
            icon: Icons.star,
            onTap: () {},
          ),
          NavigationItemWidget(
            title: "Privacy Policy",
            icon: Icons.lock,
            onTap: () {},
          ),
          NavigationItemWidget(
            title: "Settings",
            icon: Icons.settings,
            onTap: () {},
          ),
          NavigationItemWidget(
            title: "Logout",
            icon: Icons.logout,
            onTap: () {
              final bottomSheetCubit =
                  BlocProvider.of<BottomSheetCubit>(context);
              final logoutCubit = BlocProvider.of<LogoutCubit>(context);

              bottomSheetCubit.showBottomSheet();

              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => LogoutBottomSheet(
                  bottomSheetCubit: bottomSheetCubit,
                  logoutCubit: logoutCubit,
                ),
              ).whenComplete(() {
                bottomSheetCubit.hideBottomSheet();
              });
            },
          ),
        ],
      ),
    );
  }
}
