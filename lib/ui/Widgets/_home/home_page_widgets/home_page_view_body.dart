import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/feature_listview.dart';
import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/quick_access_listview.dart';
import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/quick_access_text.dart';
import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/your_health_insights_head.dart';
import 'package:chronic_diseases/ui/Widgets/_home/home_page_widgets/your_health_insights_listview.dart';
import 'package:flutter/material.dart';

import 'head_line_row.dart';
import 'tips_container.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeadLineRow(),
            SizedBox(height: 24),
            TipsContainer(),
            YourHealthInsightsHead(),
            YourHealthInsightsListview(),
            FeatureListview(),
            SizedBox(height: 24),
            QuickAccessText(),
            QuickAccessListview(),
          ],
        ),
      ),
    );
  }
}
