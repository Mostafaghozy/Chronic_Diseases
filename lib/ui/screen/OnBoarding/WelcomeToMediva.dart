import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/sliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SymptomChecker.dart';

class Welcometomediva extends StatefulWidget {
  const Welcometomediva({super.key});

  @override
  State<Welcometomediva> createState() => _WelcometomedivaState();
}

class _WelcometomedivaState extends State<Welcometomediva> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    //   count: 4,
                    // ),
                    const SizedBox(height: 10),
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
                              color: ColorsManger.OnBoarding,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 50),
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
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Button(
            text: "Get Started",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Symptomchecker(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
