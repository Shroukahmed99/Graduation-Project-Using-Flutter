import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Update%20Provider%20Profile/update_provider_profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Update%20Provider%20Profile/update_provider_profile_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20image%20cubit/profile_image_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_loading_indicator.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/function/validate_function.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/app_router.dart';

class ProfileProviderFormWidget extends StatelessWidget {
  final ProviderModel? provider;

  ProfileProviderFormWidget({Key? key, this.provider}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController yearsOfExperienceController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController priceRangeController = TextEditingController();

  final List<String> jobOptions = ['WorkOut', 'Nutirion', 'Physical Therapy'];

  void _initializeControllers() {
    if (provider != null) {
      fullNameController.text = provider?.fullName ?? '';
      yearsOfExperienceController.text = provider?.yearsOfExperience ?? '';
      mobileNumberController.text = provider?.mobileNumber ?? '';
      ageController.text = provider?.age ?? '';
      bioController.text = provider?.bio ?? '';
      jobTitleController.text = provider?.jobTitle ?? '';
      priceRangeController.text = provider?.priceRange.toString() ?? '';
    }
  }
@override
Widget build(BuildContext context) {
  _initializeControllers();

  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => UpdateProviderProfileCubit(
          ProfileRepositoryImpl(ApiService(Dio())),
          ProfileProviderCubit(ProfileRepositoryImpl(ApiService(Dio()))),
        ),
      ),
      BlocProvider(
        create: (_) => ProfileImageCubit(),
      ),
    ],
    child: BlocConsumer<UpdateProviderProfileCubit, UpdateProviderProfileState>(
      listener: (context, state) {
        if (state is UpdateProviderProfileSuccess) {
          customSnackBar(context, 'Profile updated successfully!');
          context.read<ProfileProviderCubit>().getProviderData();
          GoRouter.of(context).pushReplacement(AppRouter.kSettingProfileProviderView);
        } else if (state is UpdateProviderProfileFailure) {
          final errorMessage = state.errorMessage.toString();
          customSnackBar(context, 'Failed to update profile: $errorMessage');
        }
      },
      builder: (context, state) {
        final updateCubit = context.read<UpdateProviderProfileCubit>();

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
                      title: "Years Of Experience",
                      width: double.infinity,
                      controller: yearsOfExperienceController,
                      validator: (value) =>
                          value!.isEmpty ? 'Years of experience is required' : null,
                      hintText: "Years Of Experience",
                    ),
                    CustomTextField(
                      title: "Mobile Number",
                      width: double.infinity,
                      controller: mobileNumberController,
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
                      title: "Bio",
                      width: double.infinity,
                      controller: bioController,
                      validator: (value) =>
                          value!.isEmpty ? 'Bio is required' : null,
                      hintText: "Bio",
                    ),
                    CustomTextField(
                      title: "Job Title",
                      width: double.infinity,
                      controller: jobTitleController,
                      validator: (value) =>
                          value!.isEmpty ? 'Job title is required' : null,
                      hintText: "Job Title",
                    ),
                    CustomTextField(
                      title: "Price Range",
                      width: double.infinity,
                      controller: priceRangeController,
                      validator: (value) =>
                          value!.isEmpty ? 'Price range is required' : null,
                      hintText: "Price Range",
                    ),
                    SizedBox(height: 20.h),
                     Center(
                        child: CustomButtomProfile(
                          text: state is UpdateProviderProfileLoading
                              ? "Updating Data..."
                              : "Update Profile", 
                          onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            updateCubit.updateProviderProfile(
                              fullName: fullNameController.text,
                              mobileNumber: mobileNumberController.text,
                              age: ageController.text,
                              yearsOfExperience: yearsOfExperienceController.text,
                              jobTitle: jobTitleController.text,
                              bio: bioController.text,
                              priceRange: int.tryParse(priceRangeController.text) ?? 0,
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
            if (state is UpdateProviderProfileLoading)
              const Positioned.fill(
                child: CustomLoadingIndicator(),
              ),
          ],
        );
      },
    ),
  );
}

}
