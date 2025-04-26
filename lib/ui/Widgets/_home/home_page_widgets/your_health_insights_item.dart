import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';

class YourHealthInsightsItem extends StatelessWidget {
  const YourHealthInsightsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      width: 160,
      height: 164,
      decoration: BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffFBF0F3),
                image: const DecorationImage(
                  image: AssetImage(AssetsData.heartLogo),
                ),
              ),
              // child: const Image(
              //   height: 20,
              //   width: 20,
              //   image: AssetImage(
              //     AssetsData.heartLogo,
              //   ),
              // ),
            ),
            Text(
              "Heart Rate",
              style: Styles.textStyle12.copyWith(
                color: AppColor.kBlackColor,
              ),
            ),
          ]),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "98",
                style: Styles.textStyle24.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              Row(
                children: [
                  Text(
                    "bpm",
                    style: Styles.textStyle12.copyWith(
                      color: AppColor.kSecondaryGrayColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
