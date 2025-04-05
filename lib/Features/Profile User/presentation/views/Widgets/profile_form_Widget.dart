import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_model.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_bottom.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/custom_dropdown_widget.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/validate_function.dart';

class ProfileFormWidget extends StatelessWidget {
  final ClientModel? client;

  const ProfileFormWidget({
    Key? key,
    this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller initialization
    final fullNameController = TextEditingController(text: client?.fullName ?? '');
    final emailController = TextEditingController(text: client?.user.email ?? '');
    final phoneController = TextEditingController(text: client?.mobileNumber ?? '');
    final ageController = TextEditingController(text: client?.age ?? '');
    final weightController = TextEditingController(text: client?.weight ?? '');
    final heightController = TextEditingController(text: client?.height ?? '');

    // State for dropdown values
    String? selectedActivityLevel = client != null && client?.physicalActivityLevel != null
        ? client!.physicalActivityLevel
        : null;

    String? selectedFitnessGoal = client != null && client?.goal != null
        ? client!.goal
        : null;

    // Dropdown options
    final List<String> activityLevels = [
      'Beginner',
      'Intermediate',
      'Advanced',
    ];

    final List<String> fitnessGoals = [
      'Lose Weight',
      'Gain muscle',
      'Maintain fitness',
      'Others'
    ];

    return Form(
      key: GlobalKey<FormState>(),
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
          // Physical Activity Level dropdown
          CustomDropdownWidget(
            title: "Physical Activity Level",
            width: double.infinity,
            options: activityLevels,
            selectedValue: selectedActivityLevel,
            onChanged: (value) {
              selectedActivityLevel = value;
            },
          ),
          // Fitness Goal dropdown
          CustomDropdownWidget(
            title: "Fitness Goal",
            width: double.infinity,
            options: fitnessGoals,
            selectedValue: selectedFitnessGoal,
            onChanged: (value) {
              selectedFitnessGoal = value;
            },
          ),
          SizedBox(height: 20.h),
          Center(
            child: CustomButtomProfile(
              text: "Update Profile",
              onPressed: () {
                if (GlobalKey<FormState>().currentState?.validate() ?? false) {
                  // Handle form validation and profile update
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordSettingsView()),
                  );
                }
              },
              backgroundColor: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
