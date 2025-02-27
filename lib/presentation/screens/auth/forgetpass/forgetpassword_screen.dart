import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/config/app_string.dart';
import 'package:third_app/presentation/controller/auth/forgetPasword/forget_password_controller.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/squarebutton.dart';
import 'package:third_app/presentation/screens/auth/sighin/widgets/custom_text_field.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  late ForgetpasswordController controller;
  @override
  void initState() {
    controller = Get.find<ForgetpasswordController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Forgot \npassword?",
                    style: TextStyle(
                        color: AppColor.appblackColor,
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColor.boxOutlineColor,
                          ),
                          obscureText: false,
                          controller: controller.emailController,
                          label: AppText.emailLabel,
                          onChanged: (value) {
                            controller.validateEmail(value);
                          },
                          errorText: controller.emailError),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "*",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.appredColor),
                          ),
                          Expanded(
                            child: Text(
                              "We will send you a message to set or reset your new password",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.appblackColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => Squarebutton(
                            isActive: controller.isFormValid.value,
                            height: 55,
                            buttontext: "Submit",
                            ontap: () {
                              if (kDebugMode) {
                                print("kk");
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
