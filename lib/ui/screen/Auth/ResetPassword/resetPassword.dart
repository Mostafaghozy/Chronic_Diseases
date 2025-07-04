import 'package:chronic_diseases/models/resetPassword/cubit.dart';
import 'package:chronic_diseases/models/resetPassword/state.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/emailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/ConfirmationCode.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  String currentEmail = ''; // Store current email from onChanged

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
        ),
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                ),
              );
            }

            if (state is ForgetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                ),
              );

              // Navigate to confirmation code screen after successful API call
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ConfirmationCode(email: _emailController.text.trim()),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ForgetPasswordCubit>();

            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/signup/reset/secure icon.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Forgot your password? Please enter your \nemail and we\'ll send you confirmation code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito-SemiBold.ttf',
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: EmailWidget(
                      controller: _emailController,
                      onChanged: (email, isValid) {
                        setState(() {
                          currentEmail = email; // Store the email value
                        });
                        cubit.validateEmail(email);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Updated Button with API integration
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      return Button(
                        text: state is ForgetPasswordLoading
                            ? 'Sending...'
                            : 'Get Code',
                        onPressed: state is ForgetPasswordLoading
                            ? null
                            : () async {
                                // Use currentEmail from onChanged callback
                                final email = currentEmail.trim();

                                print(
                                  'Email from onChanged: "$email"',
                                ); // Debug print
                                print(
                                  'Email from controller: "${_emailController.text}"',
                                ); // Debug print

                                if (email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter your email address',
                                      ),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  return;
                                }

                                // Call the API
                                await cubit.sendForgetPasswordRequest(email);
                              },
                      );
                    },
                  ),

                  // Loading indicator
                  if (state is ForgetPasswordLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
