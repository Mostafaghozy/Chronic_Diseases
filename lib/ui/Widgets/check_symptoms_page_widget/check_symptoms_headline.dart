import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/styles.dart';

class CheckSymptomsHeadline extends StatelessWidget {
  const CheckSymptomsHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Check Symptoms",
          style: Styles.textStyle20.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "Analyze your symptoms and receive\n personalized insights.",
            style: Styles.textStyle12.copyWith(
              color: AppColor.kBlackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
