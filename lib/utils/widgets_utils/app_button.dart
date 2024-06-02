import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final double? width;
  final double? hight;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderRadious;
  final Color? borderColor;
  final double? borderWidth;
  AppButton(
      {this.buttonText,
      this.onPressed,
      this.width,
      this.hight,
      this.color,
      this.textStyle,
      this.elevation,
      this.borderRadious,
      this.borderWidth,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadious!),
            color: color,
            border: Border.all(color: borderColor!, width: borderWidth!)),
        // ignore: deprecated_member_use
        child: Center(
          child: Text(
            buttonText!,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
