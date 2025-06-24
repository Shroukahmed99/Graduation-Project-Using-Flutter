import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/delete_account_bottom_sheet.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/logout_bottomSheet.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/navigation_item_widget.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/app_router.dart';

class ProfileProviderSettingsList extends StatelessWidget {
  const ProfileProviderSettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigationItemWidget(
              title: "Edit Profile",
              iconPath: IconPaths.profile,
              onTap: () {
                context.push(AppRouter.kDisplayProviderProfileDetailsView);
              },
            ),
            NavigationItemWidget(
              title: "My Feed Back",
              iconPath: IconPaths.feedback,
              onTap: () {
                context.push(AppRouter.kFeedbackView);
              },
            ),
            NavigationItemWidget(
              title: "Help",
              iconPath: IconPaths.help,
              onTap: () {},
            ),
            NavigationItemWidget(
              title: "Logout",
              iconPath: IconPaths.logout,
              onTap: () {
                final bottomSheetCubit = BlocProvider.of<BottomSheetCubit>(context);
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
            NavigationItemWidget(
              title: "Notification Setting",
              iconPath: IconPaths.notification,
              onTap: () {},
            ),
            NavigationItemWidget(
              title: "Password Setting",
              iconPath: IconPaths.settingPassword,
              onTap: () {
                context.push(AppRouter.kPasswordSettingsView);
              },
            ),
            NavigationItemWidget(
              title: "Delete Account",
              iconPath: IconPaths.profile,
              onTap: () {
                final bottomSheetCubit = BlocProvider.of<BottomSheetCubit>(context);
                final deleteCubit = BlocProvider.of<DeleteAccountCubit>(context);

                bottomSheetCubit.showBottomSheet();

                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) => DeleteAccountBottomSheet(
                    bottomSheetCubit: bottomSheetCubit,
                    deleteAccountCubit: deleteCubit,
                  ),
                ).whenComplete(() {
                  bottomSheetCubit.hideBottomSheet();
                });
              },
            ),
            NavigationItemWidget(
              title: "Chatbot",
              iconPath: IconPaths.chatbot,
              onTap: () {
                context.push(AppRouter.kChatBotIntroView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
