import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chronic_diseases/models/ChangePassword/cubit.dart';
import 'package:chronic_diseases/models/ChangePassword/state.dart';

import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/DoneResetPassword.dart';

class NewPassword extends StatelessWidget {
  final String email;
  final String? verificationCode;

  const NewPassword({
    super.key,
    required this.email,
    this.verificationCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
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
        body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
            if (state is ChangePasswordSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Doneresetpassword(),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ChangePasswordCubit>();
            final isLoading = state is LoadingChangePasswordState;
            final canSubmit = state is PasswordValidationState &&
                state.isPasswordValid &&
                state.doPasswordsMatch;

            // ignore: unused_local_variable
            var button = Button;
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
                          fontWeight: FontWeight.bold),
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
                          color: Colors.grey[400]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: PasswordWidget(
                      showConfirmPassword: true,
                      onPasswordsChanged: (newPass, confirmPass) {
                        cubit.validatePassword(newPass);
                        cubit.validateConfirmPassword(confirmPass);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Button(
                    text: 'Reset password',
                    onPressed: canSubmit && !isLoading
                        ? () {
                            cubit.changePassword(
                              email: email,
                              verificationCode: verificationCode,
                            );
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
