import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final double? fontSize;
  final bool? isLoading;
  // ignore: non_constant_identifier_names
  final double? height;
  final double? width;

  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xFFB5EF74),
    this.textColor = Colors.black,
    this.fontSize = 16,
    this.isLoading,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 360,
      height: height ?? 52,
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
