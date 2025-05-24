import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExpandingDotsIndicatorWidget extends StatelessWidget {
  final PageController controller;
  final int count;

  const ExpandingDotsIndicatorWidget({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: count,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            expansionFactor: 4,
            spacing: 10,
            activeDotColor: ColorsManger.OnBoarding,
            dotColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
