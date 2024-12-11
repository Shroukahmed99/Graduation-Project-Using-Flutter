import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSliderWidget extends StatefulWidget {
  final List<int> dates;
  final int selectedDate;
  final Function(int) onDateSelected;

  const CustomSliderWidget({
    Key? key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late ScrollController _scrollController;
  int _currentSelectedDate = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentSelectedDate = widget.selectedDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double itemWidth = 60.w;
      final double middlePosition =
          (widget.dates.indexOf(_currentSelectedDate) * itemWidth);
      _scrollController.jumpTo(middlePosition -
          (MediaQuery.of(context).size.width / 2) +
          (itemWidth / 2));
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
    final double itemWidth = 60.w;
    final double middlePosition =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    int closestDate = widget.dates[0];
    double minDistance = (middlePosition - (0 + itemWidth / 2)).abs();

    for (int i = 1; i < widget.dates.length; i++) {
      final double datePosition = i * itemWidth;
      final double distance =
          (middlePosition - (datePosition + itemWidth / 2)).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestDate = widget.dates[i];
      }
    }

    setState(() {
      _currentSelectedDate = closestDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _currentSelectedDate.toString(),
          style: TextStyle(
            fontSize: 58.sp,
            fontWeight: FontWeight.bold,
          ),
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
                itemCount: widget.dates.length,
                itemBuilder: (context, index) {
                  final date = widget.dates[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentSelectedDate = date;
                      });
                      widget.onDateSelected(date);
                    },
                    child: Container(
                      width: 60.w,
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
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - 30.w,
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
      ],
    );
  }
}
