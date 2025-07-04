import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/TextField_code.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/Create_NewPassword.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConfirmationCode extends StatefulWidget {
  final String? email;

  const ConfirmationCode({super.key, this.email});

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  String? _enteredCode;
  bool _isCodeComplete = false;

  bool _isVerifying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fontWeight: FontWeight.bold,
                ),
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
                        color: Colors.grey,
                        fontFamily: 'Nunito-SemiBold.ttf',
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: widget.email ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito-SemiBold.ttf',
                        fontSize: 16,
                      ),
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
                  setState(() {
                    _enteredCode = code;
                    _isCodeComplete = code.length >= 4; // Assuming 4-digit code
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Button(
              text: 'Verify',
              onPressed: _isCodeComplete
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateNewPassword(
                            email: widget.email,
                            verificationCode: _enteredCode,
                          ),
                        ),
                      );
                    }
                  : null,
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn\'t receive the email? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Nunito-SemiBold.ttf',
                      fontSize: 14,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Resend again',
                        style: TextStyle(
                          color: Color.fromARGB(255, 153, 205, 94),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito-SemiBold.ttf',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
