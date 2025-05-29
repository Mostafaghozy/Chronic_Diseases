import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';
import 'check_symptoms_description _list.dart';
import 'check_symptoms_health_metrics.dart';

class CheckSymptomsBottomSheet extends StatelessWidget {
  const CheckSymptomsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 860,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text(
                "Cancel",
                style: Styles.textStyle16.copyWith(
                  color: AppColor.kTextButtonGreenColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            width: 334,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFF9FAFB),
                  radius: 28,
                  child: Icon(
                    Icons.assignment,
                    color: Color(0xfcb0b0b1),
                    size: 35,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  textAlign: TextAlign.center,
                  "Accurate Logging Made Easy",
                  style: Styles.textStyle32.copyWith(height: 1.1),
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  "Follow these tips to ensure your entries are clear and detailed.",
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kSubtitle2Color,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          CheckSymptomsDescriptionList(),
          SizedBox(height: 80),
          CustomButton(
            text: "Next",
            style: Styles.textStyle16,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: AppColor.kWhiteColor,
                isScrollControlled: true,
                useSafeArea: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return const CheckSymptomsHealthMetrics();
                },
              );
            },
            color: AppColor.kSecondaryGreenColor,
            width: 364,
            height: 52,
            borderRadius: 24,
          ),
        ],
      ),
    );
  }
}
