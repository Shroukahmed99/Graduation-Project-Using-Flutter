import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/role%20cubit/role_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class RoleSelectionViews extends StatelessWidget {
  const RoleSelectionViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoleCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 24.w,
          ),
          child: Column(
            children: [
              const CustomArrowBack(text: 'Back'),
              CustomSizedBox(height: 25.h),
              const CustomQuestionAndAswer(
                question: 'What’s Your Role',
              ),
              const CustomSizedBox(height: 62),
              BlocBuilder<RoleCubit, RoleState>(
                builder: (context, state) {
                  bool isProviderSelected =
                      state is RoleSelected ? state.isProvider : false;
                  bool isClientSelected =
                      state is RoleSelected ? state.isClient : false;

                  return Column(
                    children: [
                      CircleImageTextWidget(
                        images: const [
                          AssetImage('assets/images/22.png'),
                          AssetImage('assets/images/apple.png'),
                          AssetImage('assets/images/medical.png'),
                        ],
                        text: 'Service Provider',
                        isSelected: isProviderSelected, // ✅ غير محدد في البداية
                        onTap: () {
                          context
                              .read<RoleCubit>()
                              .selectRole('Service Provider');
                          GoRouter.of(context)
                              .push(AppRouter.kSignupViewService);
                        },
                      ),
                      CustomSizedBox(height: 48.h),
                      CircleImageTextWidget(
                        images: const [AssetImage('assets/images/running.png')],
                        text: 'Client',
                        isSelected: isClientSelected, // ✅ غير محدد في البداية
                        onTap: () {
                          context.read<RoleCubit>().selectRole('Client');
                          GoRouter.of(context)
                              .push(AppRouter.kSignupViewClient);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
