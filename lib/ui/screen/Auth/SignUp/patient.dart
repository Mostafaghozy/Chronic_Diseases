import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/emailWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/termsCheckbox.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/toggleButton.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/userNameWidget.dart';

import 'package:chronic_diseases/ui/screen/Auth/SignUp/done.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PatientScreen extends StatefulWidget {
  PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  List<bool> isSelected = [true, false];
  final TextEditingController _usernameController = TextEditingController();
  bool _isTermsAccepted = false; // حالة الموافقة على الشروط

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' SIGN UP',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 20,
              fontWeight: FontWeight.bold),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomToggleButtons(selectedIndex: 0),
              const SizedBox(height: 15),
              Transform.translate(
                offset: Offset(15, 5),
                child: Text("Username",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 15),
              UsernameTextField(
                controller: _usernameController,
                hintText: 'Mediva User',
              ),
              const SizedBox(height: 15),
              Transform.translate(
                offset: Offset(15, 5),
                child: Text("Email Address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              EmailWidget(),
              const SizedBox(height: 15),
              PasswordWidget(
                showConfirmPassword: true,
                passwordLabel: "Password",
                confirmPasswordLabel: "Confirm Password",
              ),
              const SizedBox(height: 15),
              TermsCircleCheckbox(
                onChanged: (value) {
                  setState(() {
                    _isTermsAccepted = value; // تحديث حالة الموافقة
                  });
                },
              ),
              const SizedBox(height: 25),
              Button(
                text: "Sign Up",
                onPressed:
                    _isTermsAccepted // 👈 تعطيل الزر إذا لم يتم قبول الشروط
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Done(),
                              ),
                            );
                          }
                        : null,
                isLoading: false,
              ),
              const SizedBox(height: 30),
              Center(
                child: Text('Mediva: Your Health, Our Priority',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
