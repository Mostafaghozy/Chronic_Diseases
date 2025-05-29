import 'package:chronic_diseases/core/widgets_core/custom_container_3.dart';
import 'package:flutter/material.dart';

class CheckSymptomsDescriptionList extends StatelessWidget {
  const CheckSymptomsDescriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer3(
          height: 84,
          width: 355,
          title: "Be Specific with Symptoms",
          subTitle:
              "Describe your symptoms in detail,\nincluding when they started and how\nsevere they are.",
          icon: Icons.mode_edit_outlined,
        ),
        SizedBox(height: 35),
        CustomContainer3(
          height: 65,
          width: 355,
          title: "Track Changes Over Time",
          subTitle:
              "Regularly update your symptoms to\nprovide a clearer picture of your health.",
          icon: Icons.track_changes,
        ),
        SizedBox(height: 35),
        CustomContainer3(
          height: 65,
          width: 355,
          title: "Check Your Entries",
          subTitle:
              "Review logged symptoms for accuracy\nbefore submitting them for analysis.",
          icon: Icons.checklist_rounded,
        ),
      ],
    );
  }
}
