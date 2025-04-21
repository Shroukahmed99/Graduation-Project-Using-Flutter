import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_header_widget_provider.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_provider_settings_list.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';

class ProfileSettingProviderBody extends StatelessWidget {
  const ProfileSettingProviderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileProviderCubit>(context).getProviderData();

    return BlocConsumer<ProfileProviderCubit, ProviderState>(
      listener: (context, state) {
        if (state is ProviderFailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ProviderLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        if (state is ProviderSuccess) {
          final provider = state.provider;

          return SafeArea(
            child: Column(
              children: [
                ProfileHeaderWidgetProvider(provider: provider, onTap: () {                   GoRouter.of(context).pushReplacement(AppRouter.kHomeProviderView);
 },),
                const SizedBox(height: 10),
                Expanded(
                  child: const ProfileProviderSettingsList(),
                ),
              ],
            ),
          );
        }

        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
