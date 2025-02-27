import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_color.dart';
import 'package:third_app/config/app_string.dart';
import 'package:third_app/presentation/controller/auth/sign_up/sign_up_controller.dart';
import 'package:third_app/presentation/screens/auth/commonwidget/squarebutton.dart';
import 'package:third_app/presentation/screens/auth/sighnup/widgets/sighup_textfiled.dart';

class SighnUpScreen extends StatefulWidget {
  const SighnUpScreen({super.key});

  @override
  State<SighnUpScreen> createState() => _SighnUpScreenState();
}

class _SighnUpScreenState extends State<SighnUpScreen> {
  SignUpController controller = Get.find<SignUpController>();

  @override
  void initState() {
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
                        "Create an \n account ",
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
                          SighupTextfiled(
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
                            () => SighupTextfiled(
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
                            height: 20,
                          ),
                          Obx(
                            () => SighupTextfiled(
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
                                controller:
                                    controller.confirmpasswordController,
                                label: AppText.cofirmpasswordTex,
                                obscureText: controller.obscurePassword.value,
                                onChanged: (value) {
                                  controller.validatePassword(value);
                                },
                                errorText: controller.confirmpasswordError),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => Squarebutton(
                                isActive: controller.isFormValid.value,
                                height: 55,
                                buttontext: "Create Account",
                                ontap: () {
                                  controller.creatAccount();
                                }),
                          ),
                          Row(
                            children: [
                              Text(
                                "I Already Have an Account",
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
                                  controller.navigateToSignIn();
                                },
                                child: Text(
                                  "Login",
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
