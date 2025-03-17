import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SymptomChecker.dart';

class Welcometomediva extends StatelessWidget {
  const Welcometomediva({super.key});

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
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "WELCOME TO ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      TextSpan(
                        text: "MEDIVA",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),

                // Subtitle text

                const Center(
                  child: Text(
                    "Your Health, Simplified. Welcome To Mediva, \nThe App That Helps You Monitor And Manage \nChronic Conditions Effortlessly. Let's Get \nStarted On Your Wellness Journey.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8A8A8E),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 107,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/mediva-1.png'),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0, -30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/mediva.png'),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Symptomchecker()));
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
                          'Get Started',
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
