import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool? isObscureText;
  final TextEditingController controller;
  final bool? enabled;
  const InputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isObscureText = false,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled!,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        isCollapsed: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
