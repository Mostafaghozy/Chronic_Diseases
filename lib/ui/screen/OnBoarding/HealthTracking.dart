import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';
import 'HealthCareProviders.dart';

class Healthtracking extends StatelessWidget {
  const Healthtracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  // const SizedBox(height:30), // Approximate spacing

                  const Center(
                    child: Text(
                      "HEALTH TRACKING",
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
                      "Monitor Vital Health Metrics Like Blood \nPressure, Blood Sugar, And More. Keep Your \nHealth In Check With Daily Updates And \nPersonalized Reports.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFB8A8A8E),
                      ),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 10,
                  // ),

                  Image.asset(
                    'assets/CARD 2.png',
                  ),

                  // fit: BoxFit.fill,

                  // const SizedBox(
                  //   height: 5,
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Healthcareproviders()));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:15),
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
                  ),


                ],
              ),

              // Get Started Button
            ],
          ),
        ),
      ]),
    );
  }
}
