import 'dart:ffi';

import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/customImageWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/sliderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import 'HealthCareProviders.dart';

class Healthtracking extends StatefulWidget {
  const Healthtracking({super.key});

  @override
  State<Healthtracking> createState() => _HealthtrackingState();
}

class _HealthtrackingState extends State<Healthtracking> {
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
              child: PageView(controller: _pageController, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ExpandingDotsIndicatorWidget(
                    //   controller: _pageController,
                    //   count: 4, // هنا حط العدد المناسب للصفحات
                    // ),
                    const SizedBox(height: 10),
                    // Approximate spacing

                    Text(
                      "HEALTH TRACKING",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Nunito',
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // Subtitle text

                    Center(
                      child: Text(
                        "Monitor Vital Health Metrics Like Blood \nPressure, Blood Sugar, And More. Keep Your \nHealth In Check With Daily Updates And \nPersonalized Reports.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFB8A8A8E),
                        ),
                      ),
                    ),
                    Center(child: const CustomImageWidget()),

                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Button(
              text: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Healthcareproviders(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),

        // Get Started Button
      ),
    );
  }
}
