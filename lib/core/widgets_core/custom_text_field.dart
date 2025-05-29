import 'package:flutter/material.dart';

import '../app_color.dart';
import '../styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.onTap,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label,
            style: Styles.textStyle16,
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controller,
          onTap: onTap,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Styles.textStyle16.copyWith(
              color: AppColor.kSecondaryGrayColor,
              fontWeight: FontWeight.w400,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
