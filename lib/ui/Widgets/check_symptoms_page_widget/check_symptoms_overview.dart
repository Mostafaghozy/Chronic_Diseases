import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_container_4.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/styles.dart';

class CheckSymptomsOverview extends StatelessWidget {
  const CheckSymptomsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        forceMaterialTransparency: true,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Check Symptoms",
          style: Styles.textStyle20.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: AppColor.kTextButtonGreenColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Image.asset(
                      AssetsData.symptomsLoggedSuccessfullyLogo,
                      width: 64,
                      height: 64,
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Symptoms logged successfully!",
                          style: Styles.textStyle16.copyWith(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Log symptoms to analyze them\nusing our AI tool.",
                          style: Styles.textStyle16.copyWith(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Summary", style: Styles.textStyle24),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.only(left: 18.5),
                width: double.infinity,
                height: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.kListTileBackGroundColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsData.analyzingResultLogo,
                      width: 64,
                      height: 64,
                    ),
                    SizedBox(width: 18.5),
                    Text(
                      "Severe Risk 70-100%\nSeek Medical Help ASAP",
                      style: Styles.textStyle16.copyWith(
                        color: AppColor.kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Your Recent Symptoms", style: Styles.textStyle24),
              ),
              SizedBox(height: 16),
              Text(
                "Last Logged Symptoms",
                style: Styles.textStyle16.copyWith(
                  color: AppColor.kSubtitle2Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  "Logged on:Feb 14, 2025 - 5:19 PM",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 100, // adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomContainer4(
                      title: "Hypertension",
                      subTitle: "140/90 (mmHg)",
                    ),
                    SizedBox(width: 10),
                    CustomContainer4(title: "Heart Disease", subTitle: "Yes"),
                    SizedBox(width: 10),
                    CustomContainer4(
                      title: "Smoking History",
                      subTitle: "Regular",
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Next Steps", style: Styles.textStyle24),
              ),
              SizedBox(height: 30),
              Center(
                child: CustomButton(
                  text: "Log New Symptoms",
                  style: Styles.textStyle18.copyWith(
                    color: AppColor.kBlackColor,
                  ),
                  onTap: () {},
                  color: AppColor.kSecondaryGreenColor,
                  width: 240,
                  height: 52,
                  borderRadius: 24,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
