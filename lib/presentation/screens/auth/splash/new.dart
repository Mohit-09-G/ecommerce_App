import 'package:flutter/material.dart';
import 'package:third_app/config/app_route.dart';

class Helo extends StatelessWidget {
  const Helo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(child: Text(AppRoutes.helo)),
    ));
  }
}
