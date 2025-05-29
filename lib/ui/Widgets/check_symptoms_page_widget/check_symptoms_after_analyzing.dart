import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile_3.dart';
import 'package:chronic_diseases/ui/Widgets/check_symptoms_page_widget/serve_details.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/styles.dart';

import 'check_symptoms_overview.dart';

class CheckSymptomsAfterAnalyzing extends StatelessWidget {
  const CheckSymptomsAfterAnalyzing({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 17,
                        color: AppColor.kTextButtonGreenColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Back",
                        style: Styles.textStyle16.copyWith(
                          color: AppColor.kTextButtonGreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckSymptomsOverview(),
                      ),
                    );
                  },
                  child: Text(
                    "Done",
                    style: Styles.textStyle16.copyWith(
                      color: AppColor.kTextButtonGreenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Based on Your\nSymptoms, Here’s\nWhat We Found!",
                  style: Styles.textStyle32.copyWith(height: 1),
                ),
                SizedBox(height: 24),
                Image.asset(
                  AssetsData.analyzingResultLogo,
                  height: 140,
                  width: 140,
                ),
                SizedBox(height: 24),
                Text(
                  textAlign: TextAlign.center,
                  "Your symptoms suggest a\nmoderate risk of Diabetes",
                  style: Styles.textStyle20.copyWith(
                    color: AppColor.kBlackColor,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsData.analyzingResultWithoutPercentageLogo,
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Severe Risk 50-100%\nSeek Medical Help ASAP",
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("What Should You Do?", style: Styles.textStyle24),
                SizedBox(height: 32),
                CustomItemListTile3(
                  title: "Contact a healthcare professional\nimmediately.",
                  icon: Icons.add_call,
                ),
                CustomItemListTile3(
                  title: "Visit a Clinic or Hospital if Symptoms Worsen",
                  icon: Icons.health_and_safety,
                ),
                CustomItemListTile3(
                  title: "Follow Medical Treatment & Recommendations",
                  icon: Icons.medication_liquid_outlined,
                ),
                SizedBox(height: 32),
                CustomButton(
                  text: "View More Details",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColor.kWhiteColor,
                      isScrollControlled: true,
                      useSafeArea: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const ServeDetails();
                      },
                    );
                  },
                  color: AppColor.kSecondaryGreenColor,
                  width: 365,
                  height: 52,
                  borderRadius: 24,
                ),
                SizedBox(height: 8),
                CustomButton(
                  text: "Check Again",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.kPrimaryColor,
                  ),
                  onTap: () {},
                  color: Colors.transparent,
                  width: 365,
                  height: 52,
                  borderRadius: 24,
                ),
                SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
