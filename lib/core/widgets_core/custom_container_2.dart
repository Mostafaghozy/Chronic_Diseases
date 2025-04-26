import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:flutter/material.dart';

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subTitle,
    required this.button,
    required this.image,
  });

  final double height;
  final double width;
  final String title;
  final String subTitle;
  final Widget button;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xffEAEAEA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Image.asset(
                  height: 26,
                  width: 26,
                  image,
                ),
              ),
              Text(
                title,
                style: Styles.textStyle24.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            subTitle,
            style: Styles.textStyle14.copyWith(
              color: AppColor.kSubtitleColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: button,
          ),
        ],
      ),
    );
  }
}
