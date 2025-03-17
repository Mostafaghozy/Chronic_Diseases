import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // تطبيق التدرج اللوني كخلفية للشاشة
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF689C4A), // اللون الأول
              Color(0xFF4F9131), // اللون الثاني
            ],
            begin: Alignment.topCenter,  // بداية التدرج من الأعلى
            end: Alignment.bottomCenter,  // نهاية التدرج في الأسفل
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/mediva LAST ONBOARDING.svg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Image.asset('assets/A Smarter Path to Better Health.png'),
              ],
            ),
            const SizedBox(height: 48),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Mediva is designed to keep you in control,\ninformed, And Inspired. Let\'s Get Started',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFECECEC),
                    fontFamily: 'Nunito-Regular.ttf',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            InkWell(
              onTap: () {
                /// TO DO
              },
              child: Center(
                child: Container(
                  width: 360,
                  height: 52,
                  decoration: BoxDecoration(
                    color: ColorsManger.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
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
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                /// TO DO
              },
              child: Center(
                child: Container(
                  width: 360,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: ColorsManger.white,
                        fontSize: 16,
                        fontFamily: 'Nunito-Regular.ttf',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
