import 'package:chronic_diseases/models/CreatePassword_Code/cubit.dart';
import 'package:chronic_diseases/models/CreatePassword_Code/state.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/DoneResetPassword.dart';

class CreateNewPassword extends StatelessWidget {
  final String? email;
  final String? verificationCode;

  const CreateNewPassword({super.key, this.email, this.verificationCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit()
        ..setEmail(email ?? '')
        ..setVerificationCode(verificationCode ?? ''),
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
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is ResetPasswordSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Doneresetpassword(),
                ),
              );
              // Show snackbar after navigation
              Future.delayed(const Duration(milliseconds: 300), () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password changed successfully'),
                    duration: Duration(seconds: 3),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                  ),
                );
              });
            }
          },
          builder: (context, state) {
            final cubit = context.read<ResetPasswordCubit>();
            final isLoading = state is ResetPasswordLoading;
            final canSubmit =
                state is ResetPasswordValidation &&
                state.isPasswordValid &&
                state.doPasswordsMatch;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/signup/reset/secure icon-2.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Create a new password',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito-SemiBold.ttf',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Please choose a password that hasn\'t been \nused before. Must be at least 8 characters.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito-SemiBold.ttf',
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: PasswordWidget(
                      showConfirmPassword: true,
                      isPasswordValid: state is ResetPasswordValidation
                          ? state.isPasswordValid
                          : false,
                      doPasswordsMatch: state is ResetPasswordValidation
                          ? state.doPasswordsMatch
                          : false,
                      onPasswordsChanged: (newPass, confirmPass) {
                        cubit.validatePassword(newPass);
                        cubit.validateConfirmPassword(confirmPass);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Button(
                    text: isLoading ? 'Resetting...' : 'Reset password',
                    onPressed: canSubmit && !isLoading
                        ? () {
                            cubit.resetPasswordWithStoredValues();
                          }
                        : null,
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
