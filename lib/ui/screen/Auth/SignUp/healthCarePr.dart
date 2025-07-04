import 'package:chronic_diseases/models/SignUp/HealthCare/cubit.dart';
import 'package:chronic_diseases/models/SignUp/HealthCare/state.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/emailWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/termsCheckbox.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/toggleButton.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/userNameWidget.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/done.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthcareInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthcarePr extends StatefulWidget {
  const HealthcarePr({super.key});

  @override
  _HealthcarePrState createState() => _HealthcarePrState();
}

class _HealthcarePrState extends State<HealthcarePr> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Healthcare Provider Information
  String _licenseNumber = '';
  String _specialization = 'GeneralPractitioner';
  String _clinicOrHospital = 'SaudiGermanHospital';

  bool _isTermsAccepted = false;

  String _getProviderInfoDisplayText() {
    if (_licenseNumber.isNotEmpty) {
      return 'License: $_licenseNumber\nSpecialization: $_specialization\nClinic: $_clinicOrHospital';
    }
    return '';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegistration() {
    if (_validateForm()) {
      context.read<HealthcareProviderCubit>().registerHealthcareProvider(
        username: _usernameController.text.trim(),
        emailAddress: _emailController.text.trim(),
        password: _passwordController.text,
        licenseNumber: _licenseNumber,
        specialization: _specialization,
        clinicOrHospital: _clinicOrHospital,
        termsAccepted: _isTermsAccepted,
      );
    }
  }

  bool _validateForm() {
    if (_usernameController.text.trim().isEmpty) {
      _showErrorSnackBar('User: Please enter username');
      return false;
    }
    if (_emailController.text.trim().isEmpty) {
      _showErrorSnackBar('User: Please enter email address');
      return false;
    }
    if (!_isValidEmail(_emailController.text.trim())) {
      _showErrorSnackBar('User: The email address is not valid');
      return false;
    }
    if (_passwordController.text.isEmpty) {
      _showErrorSnackBar('User: Please enter password');
      return false;
    }
    if (_passwordController.text.length < 6) {
      _showErrorSnackBar('User: Password must be at least 6 characters');
      return false;
    }
    if (_licenseNumber.isEmpty) {
      _showErrorSnackBar(
        'User: Please complete healthcare provider information',
      );
      return false;
    }
    if (!_isTermsAccepted) {
      _showErrorSnackBar('User: Please accept terms and conditions');
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthcareProviderCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
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
        body: BlocListener<HealthcareProviderCubit, HealthcareProviderState>(
          listener: (context, state) {
            if (state is HealthcareProviderSuccess ||
                state.runtimeType.toString() == 'PatientRegistrationSuccess') {
              final message = (state as dynamic).message;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
              Future.delayed(const Duration(seconds: 1), () {
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Done()),
                  );
                }
              });
            } else if (state is HealthcareProviderError) {
              _showErrorSnackBar(state.error);
            }
          },
          child: BlocBuilder<HealthcareProviderCubit, HealthcareProviderState>(
            builder: (context, state) {
              bool isLoading = state is HealthcareProviderLoading;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomToggleButtons(selectedIndex: 1),
                      const SizedBox(height: 15),

                      // Username Field
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      UsernameTextField(
                        controller: _usernameController,
                        hintText: 'Mediva User',
                      ),

                      // Email Field
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
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

                      // Password Field
                      const SizedBox(height: 15),
                      PasswordWidget(
                        controller: _passwordController,
                        showConfirmPassword: false,
                        passwordLabel: "Password",
                      ),

                      // Healthcare Provider Information
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
                          "Healthcare Provider Information",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      UsernameTextField(
                        controller: TextEditingController(
                          text: _getProviderInfoDisplayText(),
                        ),
                        hintText: 'License Number, Specialization, etc',
                        iconPath: "assets/icons/signup/Order.svg",
                        showArrowIcon: true,
                        onArrowPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Healthcareinformation(),
                            ),
                          );

                          if (result != null &&
                              result is Map<String, dynamic>) {
                            setState(() {
                              _licenseNumber = result['licenseNumber'] ?? '';
                              _specialization =
                                  result['specialization'] ??
                                  'GeneralPractitioner';
                              _clinicOrHospital =
                                  result['clinicOrHospital'] ??
                                  'SaudiGermanHospital';
                            });
                          }
                        },
                      ),

                      // Terms Checkbox
                      const SizedBox(height: 25),
                      TermsCircleCheckbox(
                        onChanged: (value) {
                          setState(() {
                            _isTermsAccepted = value;
                          });
                        },
                      ),

                      // Sign Up Button
                      const SizedBox(height: 25),
                      Button(
                        text: "Sign Up",
                        onPressed: _isTermsAccepted && !isLoading
                            ? _handleRegistration
                            : null,
                        isLoading: isLoading,
                      ),

                      // Footer
                      const SizedBox(height: 30),
                      const Center(
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
      ),
    );
  }
}
