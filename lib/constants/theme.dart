import 'package:flutter/material.dart';
import 'package:safe_come_home/constants/pallet.dart';

class AppTheme {
  static border([Color color = AppPallet.shadowColor]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
      );
}
