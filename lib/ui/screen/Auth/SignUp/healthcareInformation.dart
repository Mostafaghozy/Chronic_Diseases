import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/selectionWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/userNameWidget.dart';

import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthCarePr.dart';
import 'package:chronic_diseases/ui/screen/Auth/login/LoginScreen.dart';
import 'package:chronic_diseases/ui/screen/OnBoarding/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Healthcareinformation extends StatefulWidget {
  const Healthcareinformation({super.key});

  @override
  State<Healthcareinformation> createState() => _HealthcareinformationState();
}

class _HealthcareinformationState extends State<Healthcareinformation> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose(); // 👈 مهم عشان تمنع memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 1),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Healthcare Provider Information',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Transform.translate(
              offset: Offset(15, 5),
              child: Text("License Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            UsernameTextField(
              controller: _usernameController,
              hintText: 'Enter your license number',
              iconPath: "assets/icons/healthcare/Sertificate.svg",
            ),
            const SizedBox(
              height: 15,
            ),
            Transform.translate(
              offset: Offset(15, 5),
              child: Text("Specialization",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            SimpleDropdown(
              iconPath: "assets/icons/healthcare/Mortarboard.svg",
              hintText: 'choose your specialization',
              items: [
                'General Practitioner (GP)',
                'Nurse Practitioner',
                'Pharmacist'
              ],
              onChanged: (value) {
                print('Selected: $value');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Transform.translate(
              offset: Offset(15, 5),
              child: Text("Clinic/Hospital Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            SimpleDropdown(
              iconPath: "assets/icons/healthcare/stethoscope.svg",
              hintText: 'Clinic/Hospital Name',
              items: ['Saudi German Hospital', 'Military Hospital', 'Options'],
              onChanged: (value) {
                print('Selected: $value');
              },
            ),
            Spacer(),
            Button(
              text: "Done",
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HealthcarePr(),
                ),
              ),
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
