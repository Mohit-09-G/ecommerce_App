import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/config/app_string.dart';
import 'package:third_app/presentation/controller/auth/sighn_in/sighn_in_controller.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/squarebutton.dart';
import 'package:third_app/presentation/screens/auth/sighin/widgets/custom_text_field.dart';

class SighnInScreen extends StatefulWidget {
  const SighnInScreen({super.key});

  @override
  State<SighnInScreen> createState() => _SighnInScreenState();
}

class _SighnInScreenState extends State<SighnInScreen> {
  late SighnInController controller;

  @override
  void initState() {
    controller = Get.find<SighnInController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome \n Back!",
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
                            height: 20,
                          ),
                          Obx(
                            () => CustomTextField(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColor.boxOutlineColor,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.togglePasswordVisibility();
                                    },
                                    icon: Icon(
                                      controller.obscurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    )),
                                controller: controller.passwordController,
                                label: AppText.passwordTex,
                                obscureText: controller.obscurePassword.value,
                                onChanged: (value) {
                                  controller.validatePassword(value);
                                },
                                errorText: controller.passwordError),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.navigateToForget();
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: AppColor.appredColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => Squarebutton(
                                isActive: controller.isFormValid.value,
                                height: 55,
                                buttontext: "Login",
                                ontap: () {
                                  if (controller.isFormValid.value) {
                                    controller.signInWithEmailAndPassword(
                                      controller.emailController.text.trim(),
                                      controller.passwordController.text,
                                    );
                                  } else {
                                    Get.snackbar('Validation Error',
                                        'Please fill in all required fields correctly');
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Create An Account",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.appblackColor),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.navigateToSignUp();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    decorationColor: AppColor.appredColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.appredColor,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
