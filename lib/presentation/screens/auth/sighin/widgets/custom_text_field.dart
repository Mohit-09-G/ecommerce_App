import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:third_app/config/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  final Function(String) onChanged;
  final RxString errorText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.obscureText,
      this.keyboardType,
      this.suffixIcon,
      required this.onChanged,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: obscureText,
          onChanged: (value) {
            onChanged(value);
          },
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xFF868889),
            ),
            hintText: label,
            fillColor: AppColor.boxFilcolor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white, // White border color
              ),
              borderRadius: BorderRadius.circular(5), // 5px border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.boxOutlineColor, // White border color on focus
              ),
              borderRadius: BorderRadius.circular(5), // 5px border radius
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor
                    .boxOutlineColor, // White border color when not focused
              ),
              borderRadius: BorderRadius.circular(10), // 5px border radius
            ),
            labelText: null,
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
        Obx(() => errorText.value.isNotEmpty
            ? Row(
                children: [
                  Text(
                    errorText.value,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink()),
      ],
    );
  }
}
