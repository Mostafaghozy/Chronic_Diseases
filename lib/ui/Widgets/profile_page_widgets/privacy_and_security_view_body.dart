import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile_2.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurityViewBody extends StatelessWidget {
  const PrivacyAndSecurityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy & Security",
          style: Styles.textStyle20.copyWith(color: AppColor.kBlackColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 32, bottom: 20),
              width: 350,
              height: 161,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kListTileBackGroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomItemListTile2(
                    title: "Manage App Permissions",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "Data Usage & Consent",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "Login (Face ID / Fingerprint)",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 350,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kListTileBackGroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomItemListTile2(
                    title: "Session Management",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "App Lock (PIN / Pattern )",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
