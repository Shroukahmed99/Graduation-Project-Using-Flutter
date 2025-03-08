import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomSliderWidget extends StatefulWidget {
  final int start;
  final int end;
  final int step;
  final int selectedDate;
  final Function(int)? onDateSelected;
  final String? unitSymbol;

  const CustomSliderWidget({
    Key? key,
    required this.start,
    required this.end,
    required this.step,
    required this.selectedDate,
    this.onDateSelected,
    this.unitSymbol,
  }) : super(key: key);

  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  late ScrollController _scrollController;
  late List<int> dates;
  int _currentSelectedDate = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    dates = _generateDatesList();
    _currentSelectedDate = widget.selectedDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerSelectedDate();
    });

    _scrollController.addListener(_updateSelectedDate);
  }

  List<int> _generateDatesList() {
    List<int> list = [];
    for (int i = widget.start; i <= widget.end; i += widget.step) {
      list.add(i);
    }
    return list;
  }

  void _centerSelectedDate() {
    final double itemWidth = 80.w;
    final int selectedIndex = dates.indexOf(_currentSelectedDate);
    final double middlePosition = (selectedIndex * itemWidth);
    _scrollController.jumpTo(middlePosition -
        (MediaQuery.of(context).size.width / 2) +
        (itemWidth / 2));
  }

  void _updateSelectedDate() {
    final double itemWidth = 80.w;
    final double middleScreenPosition =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);

    int closestDate = dates[0];
    double minDistance = double.infinity;

    for (int i = 0; i < dates.length; i++) {
      final double itemCenterPosition = (i * itemWidth) + (itemWidth / 2);
      final double distance = (middleScreenPosition - itemCenterPosition).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestDate = dates[i];
      }
    }

    if (_currentSelectedDate != closestDate) {
      setState(() {
        _currentSelectedDate = closestDate;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateSelectedDate);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _currentSelectedDate.toString(),
                style: TextStyle(
                  fontSize: 58.sp,
                  fontWeight: FontWeight.bold,
                ),
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
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemExtent: 80.w,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentSelectedDate = date;
                      });
                      if (widget.onDateSelected != null) {
                        widget.onDateSelected!(date);
                      }
                      _scrollController.animateTo(
                        index * 80.w -
                            (MediaQuery.of(context).size.width / 2) +
                            40.w,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
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
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - 40.w,
              child: Container(
                width: 80.w,
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
          ],
        ),
      ],
    );
  }
}
