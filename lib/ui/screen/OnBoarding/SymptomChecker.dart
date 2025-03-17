import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'HealthTracking.dart';

class Symptomchecker extends StatelessWidget {
  const Symptomchecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
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

                // fit: BoxFit.fill,

                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Healthtracking()));
                  },
                  child: Center(
                    child: Container(
                      width: 360,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB5EF74),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito-SemiBold.ttf',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Get Started Button
          ],
        ),
      ),
    );
  }
}
