import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/immediate_help_card2.dart';
import 'package:flutter/material.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/immediate_help_card.dart';

class HealthCheckSummary extends StatelessWidget {
  const HealthCheckSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
                            value: 0.784, // 78.4%
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFF5722),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            '78.4%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF5722),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Severe Risk 70-100%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Seek Medical Help ASAP',
                          style: TextStyle(
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
            Row(
              children: [
                Expanded(
                  child: _buildSymptomCard('Hypertension', '140/90 mmHg'),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildSymptomCard('Heart\nDisease', 'Yes')),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSymptomCard('Smoking\nHistory', 'Regular'),
                ),
              ],
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
