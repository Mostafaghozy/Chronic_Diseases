import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/selectionWidget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/userNameWidget.dart';
import 'package:flutter/material.dart';

class Healthcareinformation extends StatefulWidget {
  const Healthcareinformation({super.key});

  @override
  State<Healthcareinformation> createState() => _HealthcareinformationState();
}

class _HealthcareinformationState extends State<Healthcareinformation> {
  final TextEditingController _licenseController = TextEditingController();
  String? selectedSpecialization;
  String? selectedClinicOrHospital;

  @override
  void dispose() {
    _licenseController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _licenseController.text.trim().isNotEmpty &&
        selectedSpecialization != null &&
        selectedClinicOrHospital != null;
  }

  void _returnData() {
    if (_isFormValid()) {
      Navigator.pop(context, {
        'licenseNumber': _licenseController.text.trim(),
        'specialization': selectedSpecialization,
        'clinicOrHospital': selectedClinicOrHospital,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(right: 1),
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Expanded wraps only the scrollable form fields
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
                          "License Number",
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
                        controller: _licenseController,
                        hintText: 'Enter your license number',
                        iconPath: "assets/icons/healthcare/Sertificate.svg",
                      ),
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
                          "Specialization",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SimpleDropdown(
                        iconPath: "assets/icons/healthcare/Mortarboard.svg",
                        hintText: 'Choose your specialization',
                        items: const [
                          'GeneralPractitioner',
                          'NursePractitioner',
                          'Pharmacist',
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedSpecialization = value;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Transform.translate(
                        offset: const Offset(15, 5),
                        child: const Text(
                          "Clinic/Hospital Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SimpleDropdown(
                        iconPath: "assets/icons/healthcare/stethoscope.svg",
                        hintText: 'Select Clinic/Hospital',
                        items: const [
                          'SaudiGermanHospital',
                          'MilitaryHospital',
                          'KingFahdHospital',
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedClinicOrHospital = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Button is always visible at the bottom
              Button(
                text: "Done",
                onPressed: _isFormValid() ? _returnData : null,
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
