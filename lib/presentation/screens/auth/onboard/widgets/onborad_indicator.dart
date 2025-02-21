import 'package:flutter/widgets.dart';
import 'package:third_app/config/app_color.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double dotSize;
  final double spacing;
  final double pillWidth;

  const PageIndicator(
      {super.key,
      required this.count,
      required this.currentIndex,
      required this.dotSize,
      required this.spacing,
      required this.pillWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          count,
          (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: spacing / 2),
                width: index == currentIndex ? pillWidth : dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dotSize / 2),
                  color: index == currentIndex
                      ? AppColor.appblackColor
                      : AppColor.appblackColor.withValues(alpha: 0.3),
                ),
              )),
    );
  }
}
