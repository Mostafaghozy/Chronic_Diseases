import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile_2.dart';
import 'package:flutter/material.dart';

class HealthDataAndReportsViewBody extends StatelessWidget {
  const HealthDataAndReportsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Data & Reports",
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
              height: 212,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kListTileBackGroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomItemListTile2(
                    title: "View Past Symptom Logs",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "Export Health Reports",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "Sync with Health Apps",
                    onTap: () {},
                  ),
                  CustomItemListTile2(
                    title: "Data Sharing Preferences",
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
