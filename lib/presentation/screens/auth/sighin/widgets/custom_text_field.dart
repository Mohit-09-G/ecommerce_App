import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final Function(String) onChanged;
  final RxString errorText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.obscureText,
      this.keyboardType,
      this.suffixIcon,
      required this.validator,
      required this.onChanged,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: (value) {
            onChanged(value);
            errorText.value = validator(value) ?? '';
          },
        )
      ],
    );
  }
}
