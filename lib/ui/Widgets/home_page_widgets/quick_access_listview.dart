import 'package:flutter/material.dart';

import 'quick_access_item.dart';

class QuickAccessListview extends StatelessWidget {
  const QuickAccessListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      height: 206,
      child: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(
              right: 12),
          child: QuickAccessItem(),
        ),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
