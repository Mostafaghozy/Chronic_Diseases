import 'package:chronic_diseases/core/app_color.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomItemListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CustomItemListTile({
    super.key,
    this.icon = Icons.settings,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.kListTileBackGroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                color: AppColor.kPrimaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: AppColor.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
