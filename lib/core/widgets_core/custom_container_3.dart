import 'package:flutter/material.dart';

import '../app_color.dart';
import '../styles.dart';

class CustomContainer3 extends StatelessWidget {
  const CustomContainer3({
    super.key,
    required this.height,
    required this.width,
    required this.title,
     this.icon,
    required this.subTitle,
  });

  final double height;
  final double width;
  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.kSecondaryGreenColor,
            radius: 32,
            child: Icon(
              icon,
              size: 32,
              color: AppColor.kBlackColor,
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                title,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              // SizedBox(height: 12),
              Flexible(
                child: Text(
                  subTitle,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: null,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.kSubtitle2Color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
