import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';

class SimpleDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final Function(String) onChanged;
  final String? iconPath;

  const SimpleDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.iconPath,
  });

  @override
  State<SimpleDropdown> createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: widget.hintText,
      items: widget.items,
      initialItem: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged(value!);
        log('Selected value: $value');
      },

      decoration: CustomDropdownDecoration(
        prefixIcon: widget.iconPath != null
            ? SvgPicture.asset(widget.iconPath!)
            : null,

        closedFillColor: Color(0xfff6f6f6),
        closedBorderRadius: BorderRadius.circular(25),
        closedBorder: Border.all(color: Colors.white),
      ),
    );
  }
}
