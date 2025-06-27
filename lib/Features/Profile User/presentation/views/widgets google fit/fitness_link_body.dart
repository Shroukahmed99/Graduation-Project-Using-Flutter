import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/goole%20fit%20cubit/fitness%20cubit/fitness_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets%20google%20fit/fitness_card_widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets%20google%20fit/refresh_button_widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets%20google%20fit/user_header_widget.dart';
import 'package:sehatak/Features/home/presentation/manger/cubit/save_name_cubit.dart';
import 'package:sehatak/core/widget/Custom_Arrow_Icon.dart';

class FitnessLinkBody extends StatefulWidget {
  const FitnessLinkBody({super.key});

  @override
  State<FitnessLinkBody> createState() => _FitnessLinkBodyState();
}

class _FitnessLinkBodyState extends State<FitnessLinkBody>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<FitnessCubit>().getFitnessData();
    context.read<ProfileImageCubit>().loadSavedImage();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<FitnessCubit>().getFitnessData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = context.watch<ProfileImageCubit>().state;
    final nameState = context.watch<SaveNameCubit>().state;
    final String name = nameState is SaveNameClientLoaded
        ? nameState.client.fullName.split(' ')[0]
        : 'User';

    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? 'Good Morning'
        : hour < 17
            ? 'Good Afternoon'
            : 'Good Evening';

    return Scaffold(
      backgroundColor: const Color(0xffFFF6E9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: BlocBuilder<FitnessCubit, FitnessState>(
            builder: (context, state) {
              if (state is FitnessLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FitnessDataLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomArrowIcon(onTap: () => Navigator.pop(context)),
                          SizedBox(width: 10.w),
                          UserHeaderWidget(
                            imageFile: imageFile,
                            greeting: greeting,
                            name: name,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Your Fitness Summary',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Wrap(
                        spacing: 16.w,
                        runSpacing: 16.h,
                        alignment: WrapAlignment.center,
                        children: [
                          FitnessCardWidget(
                            title: "calories",
                            value: "${state.calories}",
                            unit: "Kcal",
                            color: Colors.deepOrange,
                            icon: Icons.local_fire_department,
                            percent: (state.calories / 1000).clamp(0.0, 1.0),
                          ),
                          FitnessCardWidget(
                            title: "steps",
                            value: "${state.steps}",
                            unit: "steps",
                            color: Colors.orange.shade400,
                            icon: Icons.directions_walk,
                            percent: (state.steps / 20000).clamp(0.0, 1.0),
                          ),
                          FitnessCardWidget(
                            title: "heart",
                            value: "${state.heartRate}",
                            unit: "bpm",
                            color: Colors.redAccent,
                            icon: Icons.favorite,
                            percent: (state.heartRate / 150).clamp(0.0, 1.0),
                          ),
                          FitnessCardWidget(
                            title: "sleep",
                            value: "${state.sleep}",
                            unit: "mins",
                            color: Colors.indigo,
                            icon: Icons.bed,
                            percent: (state.sleep / 480).clamp(0.0, 1.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      const RefreshButtonWidget(),
                    ],
                  ),
                );
              } else if (state is FitnessFailure) {
                return Center(
                  child: Text(
                    "Error: ${state.message}",
                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
