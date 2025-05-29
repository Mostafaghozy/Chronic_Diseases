import 'package:chronic_diseases/core/app_color.dart';

import 'package:chronic_diseases/ui/Widgets/home_page_widgets/home_page_view_body.dart';
import 'package:chronic_diseases/ui/screen/check_symptoms_page_view.dart';
import 'package:chronic_diseases/ui/screen/profile_page_view.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomePageViewBody(),
          Center(child: Text("Reports")),
          CheckSymptomsPageView(),
          ProfilePageView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFFFAFAFA),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.kPrimaryColor,
        unselectedItemColor: AppColor.kUnSelectedColorBottomNav,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_outlined),
            label: "Check Symptoms",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
