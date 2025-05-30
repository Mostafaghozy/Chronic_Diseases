import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';
import 'package:chronic_diseases/models/checkSymptoms/state.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/assets.dart';
import '../../../../../../core/styles.dart';
import 'check_symptoms_after_analyzing.dart';

class CheckSymptomsAnalyzing extends StatefulWidget {
  const CheckSymptomsAnalyzing({super.key});

  @override
  State<CheckSymptomsAnalyzing> createState() => _CheckSymptomsAnalyzingState();
}

class _CheckSymptomsAnalyzingState extends State<CheckSymptomsAnalyzing> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckSymptomsCubit, CheckSymptomsState>(
      listener: (context, state) {
        if (state is CheckSymptomsSuccess) {
          // Show results when API call succeeds
          showModalBottomSheet(
            backgroundColor: AppColor.kWhiteColor,
            isScrollControlled: true,
            useSafeArea: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (BuildContext context) {
              return CheckSymptomsAfterAnalyzing();
            },
          );
        } else if (state is CheckSymptomsError) {
          // Show error dialog
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pop(); // Close analyzing screen
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      },
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
              ],
            ),
          ),
          SizedBox(height: 315),
          Column(
            children: [
              Image.asset(AssetsData.analyzingLogo, width: 48, height: 48),
              SizedBox(height: 32),
              Text(
                "Analyzing your symptoms... Please wait..",
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
