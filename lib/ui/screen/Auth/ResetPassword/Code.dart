import 'package:chronic_diseases/models/confirmationCode/cubit.dart';
import 'package:chronic_diseases/models/confirmationCode/state.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/TextField_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/Create_NewPassword.dart';

class ConfirmationCode extends StatelessWidget {
  final String email;

  const ConfirmationCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit()..sendVerificationCode(email),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
          if (state is ResetPasswordSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NewPassword(email: email),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ResetPasswordCubit>();
          final isLoading = state is ResetPasswordLoading;
          final canResend = state is! ResetPasswordLoading;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.black),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/signup/reset/secure icon-1.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Enter Confirmation code',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Nunito-SemiBold.ttf',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Enter code we sent to  ',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: 'Nunito-SemiBold.ttf',
                                fontSize: 16),
                          ),
                          TextSpan(
                            text: email,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito-SemiBold.ttf',
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OTPForm(
                      onCodeCompleted: (code) {
                        cubit.validateCode(code);
                        if (code.length == 4) {
                          cubit.verifyCode(code);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Verify',
                    onPressed: () {
                      if (cubit.code?.length == 4) {
                        cubit.verifyCode(cubit.code!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter complete code')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: canResend
                        ? () {
                            cubit.sendVerificationCode(email);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Code resent successfully!')),
                            );
                          }
                        : null,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Didn\'t receive the email? ',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: 'Nunito-SemiBold.ttf',
                                fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Resend again',
                            style: TextStyle(
                                color: canResend
                                    ? const Color.fromARGB(255, 153, 205, 94)
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito-SemiBold.ttf',
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
