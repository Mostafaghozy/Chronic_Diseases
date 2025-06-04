import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final double topPadding;
  final double? width;
  final double? height;

  const CustomImageWidget({
    super.key,
    this.topPadding = 2,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Image.asset(
        'assets/CARD 2.png',
        width: double.infinity,
        height: 500,
      ),
    );
  }
}
