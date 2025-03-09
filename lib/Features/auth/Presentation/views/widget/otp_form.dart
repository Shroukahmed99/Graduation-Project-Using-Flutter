import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/auth/Presentation/manger/otp/otp_cubit.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers =
        List.generate(5, (index) => TextEditingController());

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => SizedBox(
            height: 56.h,
            width: 55.w,
            child: TextFormField(
              controller: controllers[index],
              onChanged: (value) {
                if (value.length == 1 && index < 4) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
                _updateOtpCode(context, controllers);
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xffE1E1E1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateOtpCode(
      BuildContext context, List<TextEditingController> controllers) {
    String otp = controllers.map((e) => e.text).join();
    context.read<OtpCubit>().updateOtpCode(otp);
  }
}
