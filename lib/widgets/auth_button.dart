import 'package:flutter/material.dart';
import 'package:safe_come_home/constants/pallet.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppPallet.buttonBackgroundColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallet.buttonBackgroundColor,
          shadowColor: AppPallet.shadowColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppPallet.whiteColor,
          ),
        ),
      ),
    );
  }
}
