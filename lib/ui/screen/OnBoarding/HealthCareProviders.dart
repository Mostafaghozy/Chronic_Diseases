import 'package:chronic_diseases/ui/screen/OnBoarding/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class Healthcareproviders extends StatelessWidget {
  const Healthcareproviders({super.key});

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
                   const SizedBox(height:30), // Approximate spacing


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


                  const SizedBox(
                    height: 16,
                  ),

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

                  const SizedBox(
                    height: 10,
                  ),

                  Image.asset(
                    'assets/CARD 3.png',
                  ),

                  // fit: BoxFit.fill,

                  const SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const Signupscreen()));
                    },
                    child: Center(
                      // child: Padding(
                      //   padding: const EdgeInsets.only(top: 50),
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
                  // ),


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

