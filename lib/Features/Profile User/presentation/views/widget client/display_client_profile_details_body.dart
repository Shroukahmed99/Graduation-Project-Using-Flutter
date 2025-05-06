import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/display_profile_client_form_widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widget%20client/profile_header_widget.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class DisplayClientProfileDetailsBody extends StatelessWidget {
  const DisplayClientProfileDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileClientCubit, ClientState>(
      listener: (context, state) {
        if (state is ClientFailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ClientLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        if (state is ClientSuccess) {
          final client = state.client;

          return Column(
            children: [
              ProfileHeaderWidget(
                client: client, onTap: () {  },
                
                // onTap: () => GoRouter.of(context).push(AppRouter.kEditClientProfileView),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        DisplayProfileClientFormWidget(client: client),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
