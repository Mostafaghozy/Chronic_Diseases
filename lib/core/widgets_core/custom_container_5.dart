import 'package:chronic_diseases/core/styles.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';

class CustomContainer5 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const CustomContainer5({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 185,
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColor.kListTileBackGroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 63, height: 63),
              SizedBox(width: 10),
              Text(
                title,
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            width: 208,
            height: 58,
            child: Text(
              subtitle,
              style: Styles.textStyle14.copyWith(
                color: AppColor.kSubtitleColor,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
