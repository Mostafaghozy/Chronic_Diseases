import 'package:chronic_diseases/core/app_color.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomItemListTile2 extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomItemListTile2({
    super.key,
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
