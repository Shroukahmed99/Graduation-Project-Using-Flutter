import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSelectActivity extends StatefulWidget {
  final List<String> options;
  final Function(int)? onSelect;

  const CustomSelectActivity({super.key, required this.options, this.onSelect});

  @override
  _CustomSelectActivityState createState() => _CustomSelectActivityState();
}

class _CustomSelectActivityState extends State<CustomSelectActivity> {
  int? selectedIndex;

  Future<void> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (selectedIndex != null) {
      await sharedPreferences.setString(
          'physicalActivityLevel', widget.options[selectedIndex!]);
      print("Data Saved Successfully ✅");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.options.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onSelect?.call(index);
            saveData();
          },
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: selectedIndex == index ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(38),
              ),
              height: 64.h,
              width: 320.w,
              alignment: Alignment.center,
              child: Text(
                widget.options[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'League Spartan',
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
