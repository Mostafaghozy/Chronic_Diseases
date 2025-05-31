import 'package:chronic_diseases/models/ChangePassword/cubit.dart';
import 'package:chronic_diseases/models/Login/cubit.dart';
import 'package:chronic_diseases/models/resetPassword/cubit.dart';

import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthCarePr.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthcareInformation.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/patient.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/resetPassword.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/WelcomeToMediva.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/logo_screen.dart';
import 'package:chronic_diseases/ui/screen/check_symptoms_page_view.dart';
import 'package:chronic_diseases/ui/screen/home_page_view.dart';
import 'package:chronic_diseases/ui/screen/HealthCheckSummary.dart';
import 'package:chronic_diseases/ui/screen/notification_page_view.dart';
import 'package:chronic_diseases/ui/screen/ReportsScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart'; // Add this import

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
  // const MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
        BlocProvider(create: (_) => ChangePasswordCubit()),
        BlocProvider(create: (_) => CheckSymptomsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(surface: Colors.white),
        ),
        // routes: {
        //   '/welcome': (context) => Welcometomediva(),
        //   '/login': (context) => Loginscreen(),
        //   '/signup': (context) => PatientScreen(),
        //   '/home': (context) => HomePageView(),
        //   // Add more routes as needed
        // },
        home: HomePageView(),
        // home: CheckSymptomsPageView(),
      ),
    );
  }
}
