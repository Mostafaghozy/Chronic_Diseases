import 'package:chronic_diseases/ui/screen/OnBoarding/HealthCareProviders.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/HealthTracking.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/SignUpScreen.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/SymptomChecker.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/WelcomeToMediva.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/logo_screen.dart';
import 'package:chronic_diseases/ui/screen/login%20or%20sign%20up/NewPassword.dart';
import 'package:chronic_diseases/ui/screen/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  PasswordResetScreen(),
    );
  }
}

// var h = MediaQuery.of(context).size.height;
// log(h.toString());
