import 'package:flutter/material.dart';
import '../app_color.dart';
import '../styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.button,
  });

  final double height;
  final double width;
  final String title;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.kGreenWhiteColor,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Styles.textStyle24.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(child: button,),
        ],
      ),
    );
  }
}
