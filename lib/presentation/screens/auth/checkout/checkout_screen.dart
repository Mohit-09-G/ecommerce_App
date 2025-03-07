import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

import 'package:third_app/presentation/screens/auth/checkout/widgets/new_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find();
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
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
      body: controller.checkoutList.isEmpty
          ? Center(child: Text("Zero Items"))
          : Padding(
              padding: EdgeInsets.all(12.0),
              child: RawScrollbar(
                thumbColor: Color(0xffBBBBBB),
                thickness: 5,
                child: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.checkoutList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ItemsCard(
                            index: index,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
