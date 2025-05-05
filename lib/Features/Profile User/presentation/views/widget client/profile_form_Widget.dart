import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/optional%20edit%20profile%20cubit/optional_edit_profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/update%20profile%20client%20data.dart/update_client_profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/update%20profile%20client%20data.dart/update_client_profile_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets/custom_dropdown_field.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/core/utils/app_router.dart'; 

class ProfileFormWidget extends StatelessWidget {
  final ClientModel? client;

  ProfileFormWidget({Key? key, this.client}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  final List<String> activityLevels = ['Beginner', 'Intermediate', 'Advanced'];
  final List<String> fitnessGoals = ['Lose Weight', 'Gain muscle', 'Maintain fitness', 'Others'];

  void _initializeControllers() {
    if (client != null) {
      fullNameController.text = client?.fullName ?? '';
      emailController.text = client?.user.email ?? '';
      phoneController.text = client?.mobileNumber ?? '';
      ageController.text = client?.age ?? '';
      weightController.text = client?.weight ?? '';
      heightController.text = client?.height ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeControllers();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UpdateClientProfileCubit(
            ProfileRepositoryImpl(ApiService(Dio())),
            ProfileClientCubit(ProfileRepositoryImpl(ApiService(Dio()))),
          ),
        ),
        BlocProvider(
          create: (_) => OptionalEditProfileCubit()
            ..selectedActivityLevel = activityLevels.contains(client?.physicalActivityLevel)
                ? client?.physicalActivityLevel
                : null
            ..selectedFitnessGoal = fitnessGoals.contains(client?.goal) ? client?.goal : null,
        ),
        BlocProvider(
          create: (_) => ProfileImageCubit(),
        ),
      ],
      child: BlocConsumer<UpdateClientProfileCubit, UpdateClientProfileState>(
        listener: (context, state) {
         if (state is UpdateClientProfileSuccess) {
  customSnackBar(context, 'Profile updated successfully!');
          context.read<ProfileClientCubit>().getClientData();
              GoRouter.of(context).pushReplacement(AppRouter.kSettingProfileView);
}
else if (state is UpdateClientProfileFailure) {
            final errorMessage = state.error.toString();
            customSnackBar(context, 'Failed to update profile: $errorMessage');
          }
        },
        builder: (context, state) {
          return BlocBuilder<OptionalEditProfileCubit, void>(
            builder: (context, _) {
              final optionalCubit = context.read<OptionalEditProfileCubit>();
              final updateCubit = context.read<UpdateClientProfileCubit>();
              final imageCubit = context.read<ProfileImageCubit>();

              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            title: "Full name",
                            width: double.infinity,
                            controller: fullNameController,
                            validator: validateFullName,
                            hintText: "Full Name",
                          ),
                          CustomTextField(
                            title: "Mobile Number",
                            width: double.infinity,
                            controller: phoneController,
                            validator: validatePhone,
                            hintText: "Mobile Number",
                          ),
                          CustomTextField(
                            title: "Age",
                            width: double.infinity,
                            controller: ageController,
                            validator: validateAge,
                            hintText: "Age",
                          ),
                          CustomTextField(
                            title: "Weight",
                            width: double.infinity,
                            controller: weightController,
                            validator: validateWeight,
                            hintText: "Weight in kg",
                          ),
                          CustomTextField(
                            title: "Height",
                            width: double.infinity,
                            controller: heightController,
                            validator: validateHeight,
                            hintText: "Height in CM",
                          ),
                          SizedBox(height: 12.h),
                          CustomDropdownField(
                            title: "Physical Activity Level",
                            width: double.infinity,
                            items: activityLevels,
                            selectedValue: optionalCubit.selectedActivityLevel,
                            onChanged: optionalCubit.updateActivityLevel,
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Please select Physical Activity Level' : null,
                          ),
                          SizedBox(height: 12.h),
                          CustomDropdownField(
                            title: "Fitness Goal",
                            width: double.infinity,
                            items: fitnessGoals,
                            selectedValue: optionalCubit.selectedFitnessGoal,
                            onChanged: optionalCubit.updateFitnessGoal,
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Please select Fitness Goal' : null,
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: CustomButtomProfile(
                             text: state is UpdateClientProfileLoading
                              ? "Updating Data..."
                              : "Update Profile", 
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  if (optionalCubit.selectedActivityLevel == null ||
                                      optionalCubit.selectedFitnessGoal == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please select both Activity Level and Fitness Goal'),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                    return;
                                  }

                                  final updatedImageFile = imageCubit.state;

                                  updateCubit.updateClientProfile(
                                    fullName: fullNameController.text,
                                    email: emailController.text,
                                    mobileNumber: phoneController.text,
                                    age: ageController.text,
                                    weight: weightController.text,
                                    height: heightController.text,
                                    physicalActivityLevel: optionalCubit.selectedActivityLevel!,
                                    goal: optionalCubit.selectedFitnessGoal!,
                                  );
                                }
                              },
                              backgroundColor: accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is UpdateClientProfileLoading)
                    const Positioned.fill(
                      child: CustomLoadingIndicator(),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
