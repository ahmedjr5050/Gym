import 'package:flutter/material.dart';
import 'package:fitflow/core/utils/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color? backgroundColor; // Allow null for default green
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.width = 330.0,
    this.height = 91.0,
    this.backgroundColor = AppColors.green, // Default green color
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: backgroundColor, // Show grey if button is disabled
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
