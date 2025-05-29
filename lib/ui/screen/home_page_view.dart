import 'package:chronic_diseases/ui/Widgets/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFF0F0F0)),
      // light grey background
      body: const MyBottomNavigationBar(),
    );
  }
}
