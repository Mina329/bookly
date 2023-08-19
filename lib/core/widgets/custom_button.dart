import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.borderRadius,
      required this.textColor,
      required this.backgroundColor,
      this.fontSize,
      required this.text,
      this.onPressed});
  final VoidCallback? onPressed;
  final String text;
  final BorderRadius borderRadius;
  final Color textColor;
  final Color backgroundColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
