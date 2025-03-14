import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSliderWidget extends StatefulWidget {
  final int initialValue;
  final int step;
  final int maxValue;
  final int selectedDate;
  final Function(int)? onDateSelected;
  final String? unitSymbol;

  const CustomSliderWidget({
    Key? key,
    required this.initialValue,
    required this.step,
    required this.maxValue,
    required this.selectedDate,
    this.onDateSelected,
    this.unitSymbol,
  }) : super(key: key);

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late ScrollController _scrollController;
  int _currentSelectedDate = 0;
  late List<int> _generatedDates;
  late double _dynamicWidth; // متغير لتحديد المسافة بين الأرقام

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentSelectedDate = widget.selectedDate;

    // توليد القيم بناءً على المعطيات
    _generatedDates = List.generate(
      ((widget.maxValue - widget.initialValue) ~/ widget.step) + 1,
      (index) => widget.initialValue + (index * widget.step),
    );

    // تحديد عرض العناصر بناءً على حجم الخطوة
    _dynamicWidth = (widget.step > 10) ? 80.w : 60.w;
    if (widget.step > 50)
      _dynamicWidth = 100.w; // إذا كانت الخطوة كبيرة جدًا، نزيد المسافة

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double middlePosition =
          (_generatedDates.indexOf(_currentSelectedDate) * _dynamicWidth);
      _scrollController.jumpTo(
        middlePosition -
            (MediaQuery.of(context).size.width / 2) +
            (_dynamicWidth / 2),
      );
    });

    _scrollController.addListener(_updateSelectedDate);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateSelectedDate);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateSelectedDate() {
    final double middlePosition =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    int closestDate = _generatedDates[0];
    double minDistance = (middlePosition - (0 + _dynamicWidth / 2)).abs();

    for (int i = 1; i < _generatedDates.length; i++) {
      final double datePosition = i * _dynamicWidth;
      final double distance =
          (middlePosition - (datePosition + _dynamicWidth / 2)).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestDate = _generatedDates[i];
      }
    }

    if (_currentSelectedDate != closestDate) {
      setState(() {
        _currentSelectedDate = closestDate;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_currentSelectedDate);
      }
    }
  }

  void scrollToStartOrEnd(bool toEnd) {
    double targetPosition =
        toEnd ? (_generatedDates.length - 1) * _dynamicWidth : 0.0;
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentSelectedDate.toString(),
              style: TextStyle(
                fontSize: 58.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.unitSymbol != null)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  widget.unitSymbol!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 4.h),
        const Icon(
          Icons.arrow_drop_up,
          size: 70,
          color: accentColor,
        ),
        SizedBox(height: 8.h),
        Stack(
          children: [
            Container(
              height: 80.h,
              color: kPrimaryColor,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _generatedDates.length,
                itemBuilder: (context, index) {
                  final date = _generatedDates[index];
                  return Container(
                    width: _dynamicWidth,
                    alignment: Alignment.center,
                    child: Text(
                      date.toString(),
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: date == _currentSelectedDate
                            ? secondaryColor
                            : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - (_dynamicWidth / 2),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 65.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: secondaryColor,
                      width: 1.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: secondaryColor),
              onPressed: () => scrollToStartOrEnd(false), // الرجوع لأول قيمة
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: secondaryColor),
              onPressed: () => scrollToStartOrEnd(true), // الانتقال لآخر قيمة
            ),
          ],
        ),
      ],
    );
  }
}
