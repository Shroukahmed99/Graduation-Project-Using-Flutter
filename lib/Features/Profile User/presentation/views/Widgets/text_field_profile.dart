import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20visibility%20cubit/password_visibility_cubit.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20visibility%20cubit/password_visibility_state.dart';

class TextFieldProfile extends StatelessWidget {
  const TextFieldProfile({
    super.key,
    this.hintText,
    required this.title,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.validator,
    required this.width,
    this.hintTextColor = Colors.black,
    this.titleColor = Colors.black,
    this.isPassword = false,
  });

  final String? hintText;
  final String title;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double width;
  final Color hintTextColor;
  final Color titleColor;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
        SizedBox(height: 5.h),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                  child:
                      isPassword ? _buildPasswordField() : _buildNormalField(),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNormalField() {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      textAlign: TextAlign.start,
      decoration: _inputDecoration(),
    );
  }

  Widget _buildPasswordField() {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
          final cubit = context.read<PasswordVisibilityCubit>();
          final isVisible = state is PasswordVisible;

          return TextFormField(
            controller: controller,
            obscureText: !isVisible,
            validator: validator,
            onChanged: onChanged,
            textAlign: TextAlign.start,
            decoration: _inputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black.withOpacity(0.6),
                  size: 15,
                ),
                onPressed: () => cubit.togglePasswordVisibility(),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: hintTextColor),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        height: 0.4,
      ),
    );
  }
}
