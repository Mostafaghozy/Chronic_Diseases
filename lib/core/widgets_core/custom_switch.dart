import 'package:chronic_diseases/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColor.kPrimaryColor,
      inactiveThumbColor: AppColor.kWhiteColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineColor: WidgetStateColor.transparent,
      thumbIcon: const WidgetStatePropertyAll(
        Icon(
          Icons.circle_rounded,
          size: 25,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
