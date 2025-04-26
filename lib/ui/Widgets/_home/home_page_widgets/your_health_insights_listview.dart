import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/your_health_insights_item.dart';
import 'package:flutter/material.dart';

class YourHealthInsightsListview extends StatelessWidget {
  const YourHealthInsightsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: YourHealthInsightsItem(),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
