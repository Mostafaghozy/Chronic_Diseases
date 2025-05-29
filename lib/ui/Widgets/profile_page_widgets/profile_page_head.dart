import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/widgets_core/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/styles.dart';

class ProfilePageHead extends StatelessWidget {
  const ProfilePageHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Profile",
          style: Styles.textStyle20.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(top: 35),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.profilePicture),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Unknown Person",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "unkownperson@gmail.com",
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: "Edit",
          style: Styles.textStyle14.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w400,
          ),
          onTap: () {},
          color: AppColor.kBackgroundButtonColor,
          width: 70,
          height: 32,
          borderRadius: 24,
        ),
      ],
    );
  }
}
