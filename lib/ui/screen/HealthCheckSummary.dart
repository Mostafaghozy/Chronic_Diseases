import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/immediate_help_card2.dart';
import 'package:flutter/material.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/immediate_help_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';
import 'package:chronic_diseases/models/checkSymptoms/state.dart';

class HealthCheckSummary extends StatelessWidget {
  const HealthCheckSummary({super.key});

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

    Color progressColor = Colors.green;
    if (riskPercentage >= 70) {
      progressColor = Colors.red;
    } else if (riskPercentage >= 40) {
      progressColor = Colors.orange;
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Check Symptoms',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Success Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF75B133),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          AssetsData.symptomsLoggedSuccessfullyLogo,
                          height: 60, // Increased size
                          width: 60, // Increased size
                        ),
                        Positioned(
                          bottom: 12,
                          right: 15,
                          child: Image.asset(
                            "assets/images/Subtract.png",
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Symptoms logged successfully!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Log your steps to analyze them\nusing our AI tool.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Summary Section
            const Text(
              'Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // Risk Assessment Circle
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6), // Example: light orange background
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: [
                  // Circular Progress
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: (riskPercentage / 100), // 78.4%
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              progressColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            riskPercentage.toStringAsFixed(1) + '%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: progressColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          riskLevel,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          recommendation,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Recent Symptoms Section
            const Text(
              'Your Recent Symptoms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Last Logged Symptoms',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 16),

            // Date and Time
            Center(
              child: const Text(
                'Logged on: Feb 14, 2025 - 5:19 PM',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),

            const SizedBox(height: 16),

            // Symptoms Cards
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  if (inputData != null) ...[
                    Expanded(
                      child: _buildSymptomCard(
                        "Gender",
                        inputData.gender.isNotEmpty
                            ? inputData.gender
                            : "Not specified",
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard("Age", "${inputData.age} years"),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        "Hypertension",
                        "${inputData.hypertensionActualValue} (mmHg)",
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        "Heart Disease",
                        formatHeartDisease(inputData.heartDisease),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        "Smoking History",
                        formatSmokingHistory(inputData.smokingHistory),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        'BMI',
                        inputData.bmi.toStringAsFixed(1),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        'HbA1c Level',
                        "${inputData.hbA1cLevel.toStringAsFixed(1)}%",
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard(
                        'Blood Glucose',
                        "${inputData.bloodGlucoseLevel.toStringAsFixed(0)} mg/dL",
                      ),
                    ),
                    SizedBox(width: 12),
                  ] else ...[
                    // Fallback to original hardcoded values if no input data
                    Expanded(child: _buildSymptomCard('Hypertension', 'N/A')),
                    SizedBox(width: 12),
                    Expanded(child: _buildSymptomCard('Heart Disease', 'N/A')),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildSymptomCard('Smoking\nHistory', 'N/A'),
                    ),
                    SizedBox(width: 12),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Next Steps Section
            const Text(
              'Next Steps',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",

                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ImmediateHelpCard(),
                  SizedBox(width: 10),
                  const ImmediateHelpCard2(),
                ],
              ),
            ),

            // Action Buttons
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
