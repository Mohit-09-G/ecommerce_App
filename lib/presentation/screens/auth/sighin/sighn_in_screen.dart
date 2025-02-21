import 'package:flutter/material.dart';
import 'package:third_app/config/app_color.dart';

class SighnInScreen extends StatefulWidget {
  const SighnInScreen({super.key});

  @override
  State<SighnInScreen> createState() => _SighnInScreenState();
}

class _SighnInScreenState extends State<SighnInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome \n Back!",
                style: TextStyle(
                    color: AppColor.appblackColor,
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: textField()),
            ],
          )
        ],
      ),
    );
  }

  Widget textField() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
      ),
    );
  }
}
