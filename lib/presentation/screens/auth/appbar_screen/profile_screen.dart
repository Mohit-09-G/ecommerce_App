import 'package:flutter/material.dart';

import 'package:third_app/presentation/controller/auth/appbar/profile_screen_controller.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/squarebutton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileScreenController controller = ProfileScreenController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.backButton();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Checkout",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 22 / 18,
              fontFamily: "Montserrat"),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/profile.png",
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Squarebutton(
                      height: 50,
                      buttontext: "LogOut",
                      ontap: () {
                        controller.signOut();
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
