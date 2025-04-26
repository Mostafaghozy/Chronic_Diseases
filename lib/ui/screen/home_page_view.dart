import 'package:chronic_diseases/ui/Widgets/_home/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MyBottomNavigationBar(),
    );
  }
}
