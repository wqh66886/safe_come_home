import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool? isObscureText;
  final TextEditingController controller;
  const InputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isObscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      obscureText: isObscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing !';
        }
        return null;
      },
    );
  }
}
