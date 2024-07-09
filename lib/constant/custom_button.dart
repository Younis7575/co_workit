import 'package:co_workit/constant/custom_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor ?? Colors.blue),
          foregroundColor: WidgetStateProperty.all<Color>(foregroundColor ?? Colors.blue),
          elevation: WidgetStateProperty.all<double>(elevation ?? 4.0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
            ),
          ),
        ),
        child: Text(text,style: const TextStyle(color: CustomColor.buttonTextColor,fontSize: 16),),
      ),
    );
  }
}
