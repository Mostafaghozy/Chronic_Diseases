import 'package:flutter/material.dart';

import 'feature_item.dart';

class FeatureListview extends StatelessWidget {
  const FeatureListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      height: 165,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 12),
          child: FeatureItem(),
        ),
      ),
    );
  }
}
