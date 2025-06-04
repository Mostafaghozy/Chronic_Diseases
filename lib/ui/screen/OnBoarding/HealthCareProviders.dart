import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/sliderWidget.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'HealthTracking.dart';

class Healthcareproviders extends StatefulWidget {
  const Healthcareproviders({super.key});

  @override
  State<Healthcareproviders> createState() => _HealthcareprovidersState();
}

class _HealthcareprovidersState extends State<Healthcareproviders> {
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
                      const SizedBox(height: 10), // Approximate spacing

                      const Center(
                        child: Text(
                          "CONNET WITH ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                      const Text(
                        "HEALTHCARE PROVIDERS",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Nunito',
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Subtitle text
                      const Center(
                        child: Text(
                          "Offering A Connection To Real Healthcare \nProviders Adds To The App's Functionality,  \nEnsuring That Users Know They Can Share  \nTheir Health Data With Professionals",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFB8A8A8E),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Image.asset('assets/CARD 3.png'),
                      const SizedBox(height: 20),
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
                  MaterialPageRoute(builder: (context) => Signupscreen()),
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
