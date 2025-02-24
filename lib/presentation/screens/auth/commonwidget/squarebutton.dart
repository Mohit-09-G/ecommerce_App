import 'package:flutter/material.dart';
import 'package:third_app/config/app_color.dart';

class Squarebutton extends StatelessWidget {
  final double height;
  final String buttontext;
  final VoidCallback ontap;
  final bool isActive; // new parameter to track if button is active or not

  const Squarebutton({
    super.key,
    required this.height,
    required this.buttontext,
    required this.ontap,
    this.isActive = true, // default is active
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: isActive ? ontap : null, // Disable tap if not active
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColor.appredColor
                    : Colors.grey, // Change color based on isActive
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  buttontext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isActive
                        ? Colors.white
                        : Colors
                            .black38, // Adjust text color based on active state
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
