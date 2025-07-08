import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType; // Add this line

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle14.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w700,
            fontFamily: "Nunito",
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType, // Add this line
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.assignment,
              color: AppColor.kSecondaryGrayColor,
            ),
            constraints: BoxConstraints(maxHeight: 52, maxWidth: 365),
            filled: true,
            fillColor: Color(0xfff6f6f6),
            focusColor: Color(0xffE5E7EB),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(width: 0.5, color: Color(0xffE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(width: 0.5, color: Color(0xffE5E7EB)),
            ),
            hintText: hintText,
            hintStyle: Styles.textStyle16.copyWith(
              color: AppColor.kSecondaryGrayColor,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
