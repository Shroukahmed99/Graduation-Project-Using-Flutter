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
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderHeight> {
  late ScrollController _scrollController;
  int _currentSelectedDate = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentSelectedDate = widget.selectedDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double itemHeight = 60.h;
      final double middlePosition =
          (widget.dates.indexOf(_currentSelectedDate) * itemHeight);
      _scrollController.jumpTo(middlePosition - 150.h + (itemHeight / 2));
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
    final double itemHeight = 60.h;
    final double middlePosition = _scrollController.offset + (150.h);
    int closestDate = widget.dates[0];
    double minDistance = (middlePosition - (0 + itemHeight / 2)).abs();

    for (int i = 1; i < widget.dates.length; i++) {
      final double datePosition = i * itemHeight;
      final double distance =
          (middlePosition - (datePosition + itemHeight / 2)).abs();

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
                    final int distanceFromCenter =
                        (date - _currentSelectedDate).abs();

                    double opacity = distanceFromCenter == 0
                        ? 1.0
                        : (1.0 - (distanceFromCenter * 0.15)).clamp(0.3, 0.8);

                    return Center(
                      child: Text(
                        date.toString(),
                        style: TextStyle(
                          fontSize: 32.sp,
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
            ),

            Positioned(
              child: Container(
                width: 100.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.w,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            // **السهم في منتصف يمين الشاشة**
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
}
