import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile_2.dart';
import 'package:chronic_diseases/core/widgets_core/custom_switch.dart';
import 'package:flutter/material.dart';

class AppearanceDisplayViewBody extends StatefulWidget {
  const AppearanceDisplayViewBody({super.key});

  @override
  State<AppearanceDisplayViewBody> createState() =>
      _AppearanceDisplayViewBodyState();
}

class _AppearanceDisplayViewBodyState extends State<AppearanceDisplayViewBody> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appearance & Display",
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
              height: 131,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.kListTileBackGroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 20, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark Mode",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        CustomSwitch(
                          value: isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomItemListTile2(
                    title: "Font Size & Text Scaling",
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
