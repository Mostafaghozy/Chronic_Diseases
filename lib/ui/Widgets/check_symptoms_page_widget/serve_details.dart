import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_container_4.dart';
import 'package:chronic_diseases/core/widgets_core/custom_container_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_color.dart';
import '../../../../../../core/assets.dart';
import '../../../../../../core/styles.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';
import 'package:chronic_diseases/models/checkSymptoms/state.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:chronic_diseases/ui/screen/HealthCheckSummary.dart';

class ServeDetails extends StatelessWidget {
  ServeDetails({super.key});
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<CheckSymptomsCubit>(context).state;
    final result = state is CheckSymptomsSuccess ? state.result : null;
    final inputData = state is CheckSymptomsSuccess ? state.inputData : null;
    final riskPercentage = result?.riskPercentage ?? 60.0;
    final riskLevel =
        result?.riskLevel ?? "Severe Risk 50-100%\nSeek Medical Help ASAP";
    final recommendation =
        result?.recommendation ??
        "Your symptoms suggest a\nmoderate risk of Diabetes";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _valueNotifier.value = riskPercentage;
    });
    Color progressColor = Colors.green;
    if (riskPercentage >= 70) {
      progressColor = Colors.red;
    } else if (riskPercentage >= 40) {
      progressColor = Colors.orange;
    }

    // Helper functions to format the display values
    String formatHypertension(int? hypertension) {
      if (hypertension == 1) {
        return "Yes";
      } else {
        return "No";
      }
    }

    String formatHeartDisease(int? heartDisease) {
      if (heartDisease == 1) {
        return "Yes";
      } else {
        return "No";
      }
    }

    String formatSmokingHistory(String? smokingHistory) {
      if (smokingHistory == null || smokingHistory.isEmpty) {
        return "Not specified";
      }
      // Capitalize first letter
      return smokingHistory.substring(0, 1).toUpperCase() +
          smokingHistory.substring(1);
    }

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
                DashedCircularProgressBar.square(
                  dimensions: 80,
                  valueNotifier: _valueNotifier,
                  progress: riskPercentage,
                  startAngle: 225,
                  sweepAngle: 270,
                  foregroundColor: progressColor,
                  backgroundColor: const Color(0xffeeeeee),
                  foregroundStrokeWidth: 10,
                  backgroundStrokeWidth: 10,
                  animation: false,
                  seekSize: 6,
                  seekColor: const Color(0xffeeeeee),
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${value}%',
                            style: TextStyle(
                              color: progressColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  textAlign: TextAlign.start,
                  riskLevel,
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kBlackColor,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(recommendation, style: Styles.textStyle16),
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
                  if (inputData != null) ...[
                    CustomContainer4(
                      title: "Gender",
                      subTitle: inputData.gender.isNotEmpty
                          ? inputData.gender
                          : "Not specified",
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "Age",
                      subTitle: "${inputData.age} years",
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "Hypertension",
                      subTitle: formatHypertension(inputData.hypertension),
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "Heart Disease",
                      subTitle: formatHeartDisease(inputData.heartDisease),
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "Smoking History",
                      subTitle: formatSmokingHistory(inputData.smokingHistory),
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "BMI",
                      subTitle: inputData.bmi.toStringAsFixed(1),
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "HbA1c Level",
                      subTitle: "${inputData.hbA1cLevel.toStringAsFixed(1)}%",
                    ),
                    SizedBox(width: 12),
                    CustomContainer4(
                      title: "Blood Glucose",
                      subTitle:
                          "${inputData.bloodGlucoseLevel.toStringAsFixed(0)} mg/dL",
                    ),
                    SizedBox(width: 12),
                  ] else ...[
                    // Fallback to original hardcoded values if no input data
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
                    subtitle: riskPercentage > 50
                        ? "Unhealthy eating meals\nLack of exercise\nHigh-stress levels\n"
                        : "Occasional unhealthy meals \nSedentary lifestyle \n(long sitting hours)\n",
                    imagePath: AssetsData.lifestyleFactorLogo,
                  ),
                  SizedBox(width: 10),
                  CustomContainer5(
                    title: "Genetic Risk\nFactors",
                    subtitle: riskPercentage > 50
                        ? "Family history of diabetes\nObesity\nGenetic predisposition\n"
                        : "No known family history of diabetes \nNo prediabetes diagnosis\n",
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthCheckSummary(),
                  ),
                );
              },
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
