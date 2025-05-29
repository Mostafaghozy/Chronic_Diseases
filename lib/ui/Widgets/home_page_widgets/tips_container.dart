import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/styles.dart';

class TipsContainer extends StatelessWidget {
  const TipsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 29),
      width: 418,
      // height removed to allow content to determine height
      decoration: BoxDecoration(
        color: AppColor.kWhiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Tips',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimaryColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'MEDIVA',
                style: Styles.textStyle8.copyWith(
                  color: AppColor.kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Log Your Symptoms Now",
            style: Styles.textStyle24.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Logging your symptoms helps track changes in your health and enables personalized recommendations from Mediva.",
            style: Styles.textStyle12.copyWith(
              color: const Color(0xFF757A86),
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Log Now",
                  style: Styles.textStyle14.copyWith(
                    color: AppColor.kPrimaryColor,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColor.kPrimaryColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
