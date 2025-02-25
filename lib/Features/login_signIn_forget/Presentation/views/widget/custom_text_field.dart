import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?) onSaved; // Fix: Proper declaration

  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.validator,
    required this.inputType,
    required this.onSaved,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 311.w, // Set width
      height: 45.h, // Set height
      child: TextFormField(
        controller: _controller,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
