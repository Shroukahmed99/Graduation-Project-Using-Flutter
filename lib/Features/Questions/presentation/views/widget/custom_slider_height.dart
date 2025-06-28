import 'package:flutter/material.dart';
// تم إزالة استيراد flutter_screenutil لأنه لم يعد مستخدمًا
// import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  // تعريف الأبعاد الأساسية للتجاوب (يمكنك تعديلها حسب حجم الشاشة الأساسي لتصميمك)
  static const double _baseWidth = 375; // عرض الشاشة الأساسي
  static const double _baseHeight = 812; // ارتفاع الشاشة الأساسي

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
    // حساب مقياس الارتفاع بناءً على حجم الشاشة الحالي
    final double screenHeight = MediaQuery.of(context).size.height;
    final double heightScale = screenHeight / _baseHeight;

    final double itemHeight = 60 * heightScale; // تطبيق المقياس على ارتفاع العنصر
    final double containerHeight = 300 * heightScale; // تطبيق المقياس على ارتفاع الحاوية

    final int selectedIndex = widget.dates.indexOf(_currentSelectedDate);
    if (selectedIndex != -1) {
      final double middlePosition =
          (selectedIndex * itemHeight) - ((containerHeight - itemHeight) / 2);
      _scrollController.jumpTo(
          middlePosition.clamp(0, _scrollController.position.maxScrollExtent));
    }
  }

  void _updateSelectedDate() {
    // حساب مقياس الارتفاع بناءً على حجم الشاشة الحالي
    final double screenHeight = MediaQuery.of(context).size.height;
    final double heightScale = screenHeight / _baseHeight;

    final double itemHeight = 60 * heightScale; // تطبيق المقياس على ارتفاع العنصر
    final double containerHeight = 300 * heightScale; // تطبيق المقياس على ارتفاع الحاوية

    final double middlePosition = _scrollController.offset + (containerHeight / 2);
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
    // الحصول على أبعاد الشاشة الحالية
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // حساب عوامل المقياس (scaling factors)
    final double widthScale = screenWidth / _baseWidth;
    final double heightScale = screenHeight / _baseHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentSelectedDate.toString(),
              style: TextStyle(
                fontSize: 58 * widthScale, // تطبيق مقياس العرض على حجم الخط
                fontWeight: FontWeight.bold,
                color: Colors.black, // الرقم العلوي بجانب cm باللون الأسود
              ),
            ),
            if (widget.unitSymbol != null)
              Padding(
                padding: EdgeInsets.only(left: 8 * widthScale), // تطبيق مقياس العرض على المسافة
                child: Text(
                  widget.unitSymbol!,
                  style: TextStyle(
                    color: Colors.black, // cm لونه أسود
                    fontSize: 20 * widthScale, // تطبيق مقياس العرض على حجم الخط
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 8 * heightScale), // تطبيق مقياس الارتفاع على ارتفاع SizedBox
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100 * widthScale, // تطبيق مقياس العرض على العرض
              height: 300 * heightScale, // تطبيق مقياس الارتفاع على الارتفاع
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16 * widthScale), // تطبيق مقياس العرض على نصف قطر الحدود
              ),
            ),
            SizedBox(
              height: 300 * heightScale, // تطبيق مقياس الارتفاع على ارتفاع SizedBox
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
                  itemExtent: 60 * heightScale, // تطبيق مقياس الارتفاع على ارتفاع العنصر
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final date = widget.dates[index];
                    final bool isSelected = date == _currentSelectedDate;

                    return SizedBox(
                      height: 60 * heightScale, // تطبيق مقياس الارتفاع على ارتفاع SizedBox
                      child: Center(
                        child: Text(
                          date.toString(),
                          style: TextStyle(
                            fontSize: 32 * widthScale, // تطبيق مقياس العرض على حجم الخط
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black, // الرقم المحدد أبيض والباقي أسود
                            height: -2.3, // هذا السطر للضبط البصري، قد تحتاج لتعديله بعد التجاوب
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100 * widthScale, // تطبيق مقياس العرض على العرض
                height: 60 * heightScale, // تطبيق مقياس الارتفاع على الارتفاع
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2 * widthScale, // تطبيق مقياس العرض على عرض الحدود
                  ),
                ),
              ),
            ),
            Positioned(
              right: 90 * widthScale, // تطبيق مقياس العرض على الموضع الأيمن
              child: Icon( // تم تغييرها إلى Icon للسماح بتغيير الحجم
                Icons.arrow_left,
                size: 40 * widthScale, // تطبيق مقياس العرض على حجم الأيقونة
                color: kPrimaryColor, // لون السهم برتقالي
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
