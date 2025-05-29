import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/profile_page_head.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/profile_page_list_tile_items.dart';
import 'package:flutter/material.dart';

class ProfilePageViewBody extends StatelessWidget {
  const ProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePageHead(),
            SizedBox(height: 32),
            ProfilePageListTileItems(),
            SizedBox(height: 19),
          ],
        ),
      ),
    );
  }
}
