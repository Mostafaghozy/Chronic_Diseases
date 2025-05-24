import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/sliderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'HealthTracking.dart';

class Symptomchecker extends StatefulWidget {
  const Symptomchecker({super.key});

  @override
  State<Symptomchecker> createState() => _SymptomcheckerState();
}

class _SymptomcheckerState extends State<Symptomchecker> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ExpandingDotsIndicatorWidget(
                      //   controller: _pageController,
                      //   count: 4, //
                      // ),
                      const SizedBox(height: 10), // Approximate spacing

                      const Center(
                        child: Text(
                          "SYMPTOM CHECKER",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      // Subtitle text

                      const Center(
                        child: Text(
                          "Not feeling well? Our AI-powered Symptom \nChecker Helps You Identify Potential Health \nIssues Quickly And Easily. Get Personalized \nRecommendations In Just A Few Taps.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFB8A8A8E),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      Center(
                        child: Image.asset(
                          'assets/CARD.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Button(
              text: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Healthtracking(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
