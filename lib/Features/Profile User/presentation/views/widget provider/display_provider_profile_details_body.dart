import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/profile_header_widget_provider.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20provider/display_ProfileProviderFormWidget.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class DisplayProviderProfileDetailsBody extends StatelessWidget {
  const DisplayProviderProfileDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

          return Column(
            children: [
              BlocBuilder<ProfileImageCubit, File?>(
                builder: (context, pickedImage) {
                  return ProfileHeaderWidgetProvider(
                    provider: provider,
                    onTap: () {
                      GoRouter.of(context).pop(); // 👈 راجعي التوجيه حسب الحاجة
                    },
                  );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        DisplayProfileProviderFormWidget(provider: provider), // 👈 ويدجيت العرض فقط
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        // Default or error state
        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
