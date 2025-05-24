import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/patient.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
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
            begin: Alignment.topCenter, // بداية التدرج من الأعلى
            end: Alignment.bottomCenter, // نهاية التدرج في الأسفل
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
            const SizedBox(height: 20),
            Button(
              text: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loginscreen(),
                  ),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito-SemiBold.ttf',
                  // decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
