import 'package:flutter/material.dart';

import '../../../../../../../core/app_color.dart';
import '../../../../../../../core/styles.dart';

class QuickAccessText extends StatelessWidget {
  const QuickAccessText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Quick Access",
        style: Styles.textStyle20.copyWith(color: AppColor.kBlackColor),
      ),
    );
  }
}
