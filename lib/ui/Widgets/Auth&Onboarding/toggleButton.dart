import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/healthCarePr.dart';
import 'package:chronic_diseases/ui/screen/Auth/SignUp/patient.dart';
import 'package:flutter/material.dart';

class CustomToggleButtons extends StatelessWidget {
  final int selectedIndex;

  const CustomToggleButtons({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              if (selectedIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PatientScreen()),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  selectedIndex == 0 ? ColorsManger.green : Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(62),
                  bottomLeft: Radius.circular(62),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Patient',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              if (selectedIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HealthcarePr()),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  selectedIndex == 1 ? ColorsManger.green : Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(62),
                  bottomRight: Radius.circular(62),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Healthcare Pr',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
