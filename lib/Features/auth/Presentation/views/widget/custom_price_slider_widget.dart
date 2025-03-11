import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/const.dart';

class CustomPriceSliderWidget extends StatefulWidget {
  final int selectedPrice;
  final Function(int)? onPriceSelected;

  const CustomPriceSliderWidget({
    Key? key,
    required this.selectedPrice,
    this.onPriceSelected,
  }) : super(key: key);

  @override
  _CustomPriceSliderWidgetState createState() => _CustomPriceSliderWidgetState();
}

class _CustomPriceSliderWidgetState extends State<CustomPriceSliderWidget> {
  late ScrollController _scrollController;
  int _currentSelectedPrice = 0;
  List<int> priceRange = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _currentSelectedPrice = widget.selectedPrice;

    // إنشاء قائمة الأسعار من 100 إلى 1000 بزيادة 50
    priceRange = List.generate(19, (index) => 100 + (index * 50));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double itemWidth = 60.w;
      final double middlePosition =
          (priceRange.indexOf(_currentSelectedPrice) * itemWidth);
      _scrollController.jumpTo(middlePosition -
          (MediaQuery.of(context).size.width / 2) +
          (itemWidth / 2));
    });

    _scrollController.addListener(_updateSelectedPrice);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateSelectedPrice);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateSelectedPrice() {
    final double itemWidth = 60.w;
    final double middlePosition =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    int closestPrice = priceRange[0];
    double minDistance = (middlePosition - (0 + itemWidth / 2)).abs();

    for (int i = 1; i < priceRange.length; i++) {
      final double pricePosition = i * itemWidth;
      final double distance =
          (middlePosition - (pricePosition + itemWidth / 2)).abs();

      if (distance < minDistance) {
        minDistance = distance;
        closestPrice = priceRange[i];
      }
    }

    setState(() {
      _currentSelectedPrice = closestPrice;
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
              _currentSelectedPrice.toString(),
              style: TextStyle(
                fontSize: 58.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                "EGP", // رمز العملة
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
                itemCount: priceRange.length,
                itemBuilder: (context, index) {
                  final price = priceRange[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentSelectedPrice = price;
                      });
                      if (widget.onPriceSelected != null) {
                        widget.onPriceSelected!(price);
                      }
                    },
                    child: Container(
                      width: 60.w,
                      alignment: Alignment.center,
                      child: Text(
                        price.toString(),
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: price == _currentSelectedPrice
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
