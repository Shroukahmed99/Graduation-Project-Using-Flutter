import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSliderHeight extends StatefulWidget {
  final List<int> dates;
  final int selectedDate;
  final Function(int)? onDateSelected;
  final String? unitSymbol;

  const CustomSliderHeight({
    Key? key,
    required this.dates,
    required this.selectedDate,
    this.onDateSelected,
    this.unitSymbol,
  }) : super(key: key);

  @override
  _CustomSliderHeightState createState() => _CustomSliderHeightState();
}

class _CustomSliderHeightState extends State<CustomSliderHeight> {
  late ScrollController _scrollController;
  late int _currentSelectedDate;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentSelectedDate = widget.selectedDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jumpToInitialPosition();
    });
  }

  void _jumpToInitialPosition() {
    final double itemHeight = 60.h;
    final int selectedIndex = widget.dates.indexOf(_currentSelectedDate);
    if (selectedIndex != -1) {
      final double middlePosition =
          (selectedIndex * itemHeight) - ((300.h - itemHeight) / 2);
      _scrollController.jumpTo(
          middlePosition.clamp(0, _scrollController.position.maxScrollExtent));
    }
  }

  void _updateSelectedDate() {
    final double itemHeight = 60.h;
    final double middlePosition = _scrollController.offset + (300.h / 2);
    int closestIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < widget.dates.length; i++) {
      final double itemCenter = i * itemHeight + itemHeight / 2;
      final double distance = (itemCenter - middlePosition).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestIndex = i;
      }
    }

    final newSelected = widget.dates[closestIndex];
    if (newSelected != _currentSelectedDate) {
      setState(() {
        _currentSelectedDate = newSelected;
        widget.onDateSelected?.call(newSelected);
      });
    }
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
        SizedBox(height: 8.h),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(
              height: 300.h,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    _updateSelectedDate();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.dates.length,
                  itemExtent: 60.h,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final date = widget.dates[index];
                    final bool isSelected = date == _currentSelectedDate;

                    return Center(
                      child: Text(
                        date.toString(),
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? secondaryColor : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // ✅ تم تعديل مكان المربع الأبيض ليكون في المنتصف تمامًا
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 90.w,
              child: const Icon(
                Icons.arrow_left,
                size: 40,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
