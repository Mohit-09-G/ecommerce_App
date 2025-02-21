import 'package:flutter/material.dart';
import 'package:third_app/config/app_color.dart';

class OnboardingPoint extends StatelessWidget {
  final String text;

  const OnboardingPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.check_sharp,
              color: AppColor.appgreyColor,
              size: 24,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColor.appgreyColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
