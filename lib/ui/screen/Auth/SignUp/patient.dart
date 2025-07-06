import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/models/SignUp/patient/cubitPatient.dart';
import 'package:chronic_diseases/models/SignUp/patient/statePatient.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/emailWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/termsCheckbox.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/toggleButton.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/userNameWidget.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/done.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
import 'package:chronic_diseases/core/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  List<bool> isSelected = [true, false];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isTermsAccepted = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientRegistrationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'SIGN UP',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/mediva login top-right.svg'),
            ),
          ],
        ),
        body: BlocConsumer<PatientRegistrationCubit, PatientRegistrationState>(
          listener: (context, state) {
            if (state is PatientRegistrationSuccess) {
              // Save username to session
              UserSession.saveUsername(_usernameController.text.trim());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              // Navigate to done screen after successful registration
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Done()),
                );
              });
            } else if (state is PatientRegistrationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state is PatientRegistrationValidationError) {
              // Show validation errors
              String errorMessage = state.errors.values.first;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is PatientRegistrationLoading;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomToggleButtons(selectedIndex: 0),
                    const SizedBox(height: 15),
                    Transform.translate(
                      offset: Offset(15, 5),
                      child: Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    UsernameTextField(
                      controller: _usernameController,
                      hintText: 'Mediva User',
                    ),
                    const SizedBox(height: 15),
                    Transform.translate(
                      offset: Offset(15, 5),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    EmailWidget(controller: _emailController),
                    const SizedBox(height: 15),
                    PasswordWidget(
                      showConfirmPassword: true,
                      passwordLabel: "Password",
                      confirmPasswordLabel: "Confirm Password",
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                    const SizedBox(height: 15),
                    TermsCircleCheckbox(
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    Button(
                      text: "Sign Up",
                      onPressed: _isTermsAccepted && !isLoading
                          ? () {
                              context
                                  .read<PatientRegistrationCubit>()
                                  .registerPatient(
                                    username: _usernameController.text.trim(),
                                    emailAddress: _emailController.text.trim(),
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    termsAccepted: _isTermsAccepted,
                                  );
                            }
                          : null,
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Mediva: Your Health, Our Priority',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
