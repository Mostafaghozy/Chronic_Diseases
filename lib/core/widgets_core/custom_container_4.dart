import 'package:flutter/material.dart';

import '../app_color.dart';
import '../styles.dart';

class CustomContainer4 extends StatelessWidget {
  const CustomContainer4({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 140,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.kListTileBackGroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
          Text(
            subTitle,
            style: Styles.textStyle12.copyWith(
              color: AppColor.kSubtitleColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
