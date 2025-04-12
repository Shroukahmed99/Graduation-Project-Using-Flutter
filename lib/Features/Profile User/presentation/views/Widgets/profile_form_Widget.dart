import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/optional%20edit%20profile%20cubit/optional_edit_profile_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets/custom_dropdown_field.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/validate_function.dart';

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

    return BlocProvider(
      create: (_) => OptionalEditProfileCubit()
        ..selectedActivityLevel = activityLevels.contains(client?.physicalActivityLevel) ? client?.physicalActivityLevel : null
        ..selectedFitnessGoal = fitnessGoals.contains(client?.goal) ? client?.goal : null,
      child: BlocBuilder<OptionalEditProfileCubit, void>(
        builder: (context, _) {
          final cubit = context.read<OptionalEditProfileCubit>();
          return SingleChildScrollView(
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
                    title: "Email",
                    width: double.infinity,
                    controller: emailController,
                    validator: validateEmail,
                    hintText: "example@gmail.com",
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
                    selectedValue: cubit.selectedActivityLevel,
                    onChanged: cubit.updateActivityLevel,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please select Physical Activity Level' : null,
                  ),
                  SizedBox(height: 12.h),
                  CustomDropdownField(
                    title: "Fitness Goal",
                    width: double.infinity,
                    items: fitnessGoals,
                    selectedValue: cubit.selectedFitnessGoal,
                    onChanged: cubit.updateFitnessGoal,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please select Fitness Goal' : null,
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: CustomButtomProfile(
                      text: "Update Profile",
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasswordSettingsView(),
                            ),
                          );
                        }
                      },
                      backgroundColor: accentColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
