import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpForm extends StatefulWidget {
  final Function(String) onOtpComplete;
  const OtpForm({super.key, required this.onOtpComplete});

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(5, (index) => TextEditingController());
    focusNodes = List.generate(5, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged() {
    String otpCode = otpControllers.map((controller) => controller.text).join();
    if (otpCode.length == 5) {
      widget.onOtpComplete(otpCode); // تمرير رمز الـ OTP المكتمل إلى الـ View
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) => _buildOtpField(context, index)),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, int index) {
    return SizedBox(
      height: 56.h,
      width: 55.w,
      child: TextFormField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 4) {
              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
          _onOtpChanged();
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
    );
  }
}
