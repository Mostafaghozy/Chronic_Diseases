import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_text_form_field.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';
import 'package:chronic_diseases/models/checkSymptoms/state.dart';
import 'package:chronic_diseases/models/checkSymptoms/prediction_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/styles.dart';

import 'check_symptoms_analyzing.dart';

class CheckSymptomsHealthMetrics extends StatefulWidget {
  const CheckSymptomsHealthMetrics({super.key});

  @override
  State<CheckSymptomsHealthMetrics> createState() =>
      _CheckSymptomsHealthMetricsState();
}

class _CheckSymptomsHealthMetricsState
    extends State<CheckSymptomsHealthMetrics> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all required fields
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _hypertensionController = TextEditingController();
  final TextEditingController _heartDiseaseController = TextEditingController();
  final TextEditingController _smokingHistoryController =
      TextEditingController();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _hbA1cController = TextEditingController();
  final TextEditingController _bloodGlucoseController = TextEditingController();

  @override
  void dispose() {
    _genderController.dispose();
    _ageController.dispose();
    _hypertensionController.dispose();
    _heartDiseaseController.dispose();
    _smokingHistoryController.dispose();
    _bmiController.dispose();
    _hbA1cController.dispose();
    _bloodGlucoseController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final request = PredictionRequestModel(
        gender: _genderController.text.trim(),
        age: int.tryParse(_ageController.text) ?? 0,
        hypertension: _parseHypertension(_hypertensionController.text),
        heartDisease: _parseHeartDisease(_heartDiseaseController.text),
        smokingHistory: _smokingHistoryController.text.trim(),
        bmi: double.tryParse(_bmiController.text) ?? 0.0,
        hbA1cLevel: double.tryParse(_hbA1cController.text) ?? 0.0,
        bloodGlucoseLevel: double.tryParse(_bloodGlucoseController.text) ?? 0.0,
      );

      context.read<CheckSymptomsCubit>().predictSymptoms(request);
    }
  }

  int _parseHypertension(String value) {
    // If user enters something like "140/90" or just "yes", convert to 1
    // Otherwise, if "no" or empty, convert to 0
    if (value.toLowerCase().contains('yes') ||
        value.contains('/') ||
        value.contains('high')) {
      return 1;
    }
    return 0;
  }

  int _parseHeartDisease(String value) {
    if (value.toLowerCase().contains('yes') ||
        value.toLowerCase().contains('true')) {
      return 1;
    }
    return 0;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateNumber(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckSymptomsCubit(),
      child: SizedBox(
        width: double.infinity,
        height: 860,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
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
                SizedBox(height: 30),
                Text(
                  "Health Metrics",
                  style: Styles.textStyle24.copyWith(
                    color: Color(0xff22292E),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 32),
                CustomTextFormField(
                  title: "Gender",
                  hintText: "Male or Female",
                  controller: _genderController,
                  validator: (value) => _validateRequired(value, "Gender"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "Age",
                  hintText: "Enter your age (e.g., 30)",
                  controller: _ageController,
                  validator: (value) => _validateNumber(value, "Age"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "Hypertension",
                  hintText: "Yes/No or blood pressure (e.g., 140/90)",
                  controller: _hypertensionController,
                  validator: (value) =>
                      _validateRequired(value, "Hypertension"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "Heart Disease",
                  hintText: "Yes or No",
                  controller: _heartDiseaseController,
                  validator: (value) =>
                      _validateRequired(value, "Heart Disease"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "Smoking History",
                  hintText: "never, former, current, regular",
                  controller: _smokingHistoryController,
                  validator: (value) =>
                      _validateRequired(value, "Smoking History"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "BMI",
                  hintText: "Enter BMI (e.g., 30.66)",
                  controller: _bmiController,
                  validator: (value) => _validateNumber(value, "BMI"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "HbA1c Level",
                  hintText: "Enter HbA1c level (e.g., 4.6)",
                  controller: _hbA1cController,
                  validator: (value) => _validateNumber(value, "HbA1c Level"),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  title: "Blood Glucose Level",
                  hintText: "Enter glucose level (e.g., 400)",
                  controller: _bloodGlucoseController,
                  validator: (value) =>
                      _validateNumber(value, "Blood Glucose Level"),
                ),
                const SizedBox(height: 32),
                BlocBuilder<CheckSymptomsCubit, CheckSymptomsState>(
                  builder: (context, state) {
                    final isLoading = state is CheckSymptomsLoading;
                    return CustomButton(
                      text: isLoading ? "Checking..." : "Check Now",
                      style: Styles.textStyle16,
                      onTap: () {
                        if (!isLoading) {
                          _submitForm();
                        }
                      },
                      color: AppColor.kSecondaryGreenColor,
                      width: 364,
                      height: 52,
                      borderRadius: 24,
                    );
                  },
                  // builder: (BuildContext context, CheckSymptomsState state) {
                  //   return const CheckSymptomsAnalyzing();
                  // },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
