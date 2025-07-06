import 'package:flutter/material.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/logo_screen.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/WelcomeToMediva.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/patient.dart';
import 'package:chronic_diseases/ui/screen/home_page_view.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthCarePr.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthcareInformation.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/resetPassword.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/ConfirmationCode.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/Create_NewPassword.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/DoneResetPassword.dart';
import 'package:chronic_diseases/ui/screen/check_symptoms_page_view.dart';
import 'package:chronic_diseases/ui/screen/HealthCheckSummary.dart';
import 'package:chronic_diseases/ui/screen/notification_page_view.dart';
import 'package:chronic_diseases/ui/screen/ReportsScreen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/IntroScreen': (context) => const IntroScreen(),
  '/welcome': (context) => const Welcometomediva(),
  '/login': (context) => Loginscreen(),
  '/signup': (context) => const PatientScreen(),
  '/healthcare_signup': (context) => const HealthcarePr(),
  '/home': (context) => const HomePageView(),
  '/healthcare_info': (context) => const Healthcareinformation(),
  '/reset_password': (context) => const ResetPassword(),
  '/confirmation_code': (context) => const ConfirmationCode(),
  '/create_new_password': (context) => const CreateNewPassword(),
  '/done_reset_password': (context) => const Doneresetpassword(),
  '/check_symptoms': (context) => const CheckSymptomsPageView(),
  '/health_check_summary': (context) => const HealthCheckSummary(),
  '/notification': (context) => const NotificationPageView(),
  '/reports': (context) => const ReportsScreen(),
};
