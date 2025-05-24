import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/sliderWidget.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/SignUpScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class Healthcareproviders extends StatefulWidget {
  const Healthcareproviders({super.key});

  @override
  State<Healthcareproviders> createState() => _HealthcareprovidersState();
}

class _HealthcareprovidersState extends State<Healthcareproviders> {
  final PageController _pageController = PageController();
  // Removed _currentPage and _pageCount as they are no longer used

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              // Add ExpandingDotsIndicatorWidget at the top
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                // child: ExpandingDotsIndicatorWidget(
                //   controller: _pageController,
                //   count: 4,
                // ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    // _currentPage removed, no action needed
                  },
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          "CONNET WITH ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Nunito',
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
                        Image.asset(
                          'assets/CARD 3.png',
                        ),
                        const SizedBox(height: 20),
                        Button(
                          text: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signupscreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
