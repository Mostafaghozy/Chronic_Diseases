import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_container_4.dart';
import 'package:chronic_diseases/core/widgets_core/custom_container_5.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/app_color.dart';
import '../../../../../../core/assets.dart';
import '../../../../../../core/styles.dart';

class ServeDetails extends StatelessWidget {
  const ServeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 13),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 17,
                  color: AppColor.kTextButtonGreenColor,
                ),
                SizedBox(width: 5),
                Text(
                  "Back",
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kTextButtonGreenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 29),
            Row(
              children: [
                // Image.asset(
                //   AssetsData.analyzingResultLogo,
                //   height: 64,
                //   width: 64,
                // ),
                SizedBox(width: 20),
                Text(
                  textAlign: TextAlign.start,
                  "Severe Risk 50-100%\nSeek Medical Help ASAP",
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kBlackColor,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Your symptoms indicate a high risk. Seek medical attention immediately.",
              style: Styles.textStyle16,
            ),
            SizedBox(height: 48),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Metrics You Reported", style: Styles.textStyle24),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 100, // adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomContainer4(
                    title: "Hypertension",
                    subTitle: "140/90 (mmHg)",
                  ),
                  SizedBox(width: 12),
                  CustomContainer4(title: "Heart Disease", subTitle: "Yes"),
                  SizedBox(width: 12),
                  CustomContainer4(
                    title: "Smoking History",
                    subTitle: "Regular",
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
            SizedBox(height: 55),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Possible Causes of Your Risk Level",
                style: Styles.textStyle24,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomContainer5(
                    title: "Lifestyle\nFactors",
                    subtitle:
                        "Unhealthy eating habits\nLack of exercise\nHigh-stress levels\n",
                    imagePath: AssetsData.lifestyleFactorLogo,
                  ),
                  SizedBox(width: 10),
                  CustomContainer5(
                    title: "Genetic Risk\nFactors",
                    subtitle:
                        "Family history of diabetes\nPreviously diagnosed with\nprediabetes.",
                    imagePath: AssetsData.geneticRiskFactorLogo,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 70),
            CustomButton(
              text: "Consult a Doctor",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
              onTap: () {},
              color: AppColor.kSecondaryGreenColor,
              width: 365,
              height: 52,
              borderRadius: 24,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
