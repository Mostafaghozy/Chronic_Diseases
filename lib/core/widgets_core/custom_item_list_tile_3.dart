import 'package:chronic_diseases/core/app_color.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomItemListTile3 extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CustomItemListTile3({
    super.key,
    this.icon = Icons.settings,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: AppColor.kPrimaryColor, size: 40),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: Styles.textStyle16)),
        ],
      ),
    );
  }
}
