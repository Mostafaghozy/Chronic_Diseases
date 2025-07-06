import 'package:chronic_diseases/models/CreatePassword_Code/cubit.dart';
import 'package:chronic_diseases/models/SignUp/patient/cubitPatient.dart';
import 'package:chronic_diseases/models/Login/cubit.dart';
import 'package:chronic_diseases/models/SignUp/HealthCare/cubit.dart';
import 'package:chronic_diseases/models/resetPassword/cubit.dart';
import 'package:chronic_diseases/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/checkSymptoms/cubit.dart';

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
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<HealthcareProviderCubit>(
          create: (context) => HealthcareProviderCubit(),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider<CheckSymptomsCubit>(
          create: (context) => CheckSymptomsCubit(),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
        ),
        BlocProvider<PatientRegistrationCubit>(
          create: (context) => PatientRegistrationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/IntroScreen',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(surface: Colors.white),
        ),

        routes: appRoutes,
        // home: ResetPassword(),
      ),
    );
  }
}
