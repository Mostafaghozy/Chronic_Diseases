import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xFFB5EF74),
    this.textColor = Colors.black,
    this.fontSize = 16,
    required bool isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: 'Nunito-SemiBold.ttf',
          ),
        ),
      ),
    );
  }
}
