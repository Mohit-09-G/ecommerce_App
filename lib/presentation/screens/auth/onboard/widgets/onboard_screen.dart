import 'package:flutter/material.dart';
import 'package:third_app/config/app_color.dart';

class OnboardScreen extends StatelessWidget {
  final String image;
  final String description1;
  final String description2;
  //final String decription3;

  const OnboardScreen({
    super.key,
    required this.image,
    required this.description1,
    required this.description2,
    //  required this.decription3
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(height: 300, image),
            ),
            Column(
              children: [
                SizedBox(
                  child: Text(
                    description1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 24,
                      color: AppColor.appblackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Text(
                    description2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 14,
                      color: AppColor.appgreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
