import 'package:flutter/material.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';

class ImmediateHelpCard extends StatelessWidget {
  const ImmediateHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Need Immediate \nHelp?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Contact a doctor or \nemergency services now.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Nunito",
              ),
            ),
            const SizedBox(height: 12),
            Button(
              text: 'Contact Now',
              height: 50,
              width: 150,
              textColor: Colors.black,
              fontSize: 14,
              onPressed: () {},
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
