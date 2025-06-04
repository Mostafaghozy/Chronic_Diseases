import 'package:chronic_diseases/ui/screen/OnBoarding/WelcomeToMediva.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const Welcometomediva(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: const Duration(milliseconds: 1000),
            ),
          );
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SvgPicture.asset('assets/mediva LOGO GREEN.svg')),
    );
  }
}
