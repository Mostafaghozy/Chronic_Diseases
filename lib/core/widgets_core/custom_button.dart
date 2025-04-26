import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.style,
    required this.onTap,
    required this.color,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  final String text;
  final TextStyle style;
  final VoidCallback onTap;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
