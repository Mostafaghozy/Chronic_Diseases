import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile_3.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/serve_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';
import 'package:chronic_diseases/models/checkSymptoms/state.dart';
import '../../../../../../core/app_color.dart';
import '../../../../../../core/styles.dart';

import 'check_symptoms_overview.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class CheckSymptomsAfterAnalyzing extends StatelessWidget {
  CheckSymptomsAfterAnalyzing({super.key});
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckSymptomsCubit, CheckSymptomsState>(
      builder: (context, state) {
        if (state is CheckSymptomsLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.kPrimaryColor),
          );
        }

        if (state is CheckSymptomsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  'Error occurred',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: "Try Again",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () => Navigator.pop(context),
                  color: AppColor.kPrimaryColor,
                  width: 200,
                  height: 48,
                  borderRadius: 24,
                ),
              ],
            ),
          );
        }

        // Get the prediction result from successful state
        final result = state is CheckSymptomsSuccess ? state.result : null;
        final riskPercentage = result?.riskPercentage ?? 60.0;
        final riskLevel =
            result?.riskLevel ?? "Severe Risk 50-100%\nSeek Medical Help ASAP";
        final recommendation =
            result?.recommendation ??
            "Your symptoms suggest a\nmoderate risk of Diabetes";
        final actions =
            result?.actions ??
            [
              "Contact a healthcare professional\nimmediately.",
              "Visit a Clinic or Hospital if Symptoms Worsen",
              "Follow Medical Treatment & Recommendations",
            ];

        // Update the progress value
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _valueNotifier.value = riskPercentage;
        });

        // Determine colors based on risk percentage
        Color progressColor = Colors.green;
        if (riskPercentage >= 70) {
          progressColor = Colors.red;
        } else if (riskPercentage >= 40) {
          progressColor = Colors.orange;
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
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
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckSymptomsOverview(),
                          ),
                        );
                      },
                      child: Text(
                        "Done",
                        style: Styles.textStyle16.copyWith(
                          color: AppColor.kTextButtonGreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Based on Your\nSymptoms, Here's\nWhat We Found!",
                      style: Styles.textStyle32.copyWith(height: 1),
                    ),
                    SizedBox(height: 24),
                    DashedCircularProgressBar.aspectRatio(
                      aspectRatio: 1, // width ÷ height
                      valueNotifier: _valueNotifier,
                      progress: riskPercentage,
                      startAngle: 225,
                      sweepAngle: 270,
                      foregroundColor: progressColor,
                      backgroundColor: const Color(0xffeeeeee),
                      foregroundStrokeWidth: 15,
                      backgroundStrokeWidth: 15,
                      animation: true,
                      seekSize: 6,
                      seekColor: const Color(0xffeeeeee),
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: _valueNotifier,
                          builder: (_, double value, __) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${value.toInt()}%',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 60,
                                ),
                              ),
                              Text(
                                'Risk Level',
                                style: const TextStyle(
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      textAlign: TextAlign.center,
                      recommendation,
                      style: Styles.textStyle20.copyWith(
                        color: AppColor.kBlackColor,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsData.analyzingResultWithoutPercentageLogo,
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(width: 12),
                          Text(
                            riskLevel,
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("What Should You Do?", style: Styles.textStyle24),
                    SizedBox(height: 32),
                    // Display actions from API response
                    ...actions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final action = entry.value;
                      IconData actionIcon;

                      // Assign icons based on action content or index
                      if (action.toLowerCase().contains('contact') ||
                          action.toLowerCase().contains('call')) {
                        actionIcon = Icons.add_call;
                      } else if (action.toLowerCase().contains('hospital') ||
                          action.toLowerCase().contains('clinic')) {
                        actionIcon = Icons.health_and_safety;
                      } else if (action.toLowerCase().contains('treatment') ||
                          action.toLowerCase().contains('medication')) {
                        actionIcon = Icons.medication_liquid_outlined;
                      } else if (action.toLowerCase().contains('test')) {
                        actionIcon = Icons.science_outlined;
                      } else {
                        // Default icons for additional actions
                        final defaultIcons = [
                          Icons.add_call,
                          Icons.health_and_safety,
                          Icons.medication_liquid_outlined,
                          Icons.science_outlined,
                          Icons.info_outline,
                        ];
                        actionIcon = defaultIcons[index % defaultIcons.length];
                      }

                      return CustomItemListTile3(
                        title: action,
                        icon: actionIcon,
                      );
                    }).toList(),
                    SizedBox(height: 32),
                    CustomButton(
                      text: "View More Details",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColor.kWhiteColor,
                          isScrollControlled: true,
                          useSafeArea: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ServeDetails();
                          },
                        );
                      },
                      color: AppColor.kSecondaryGreenColor,
                      width: 365,
                      height: 52,
                      borderRadius: 24,
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      text: "Check Again",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.kPrimaryColor,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      color: Colors.transparent,
                      width: 365,
                      height: 52,
                      borderRadius: 24,
                    ),
                    SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
