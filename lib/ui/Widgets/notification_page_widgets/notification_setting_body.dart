import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_notification_container_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';

class NotificationSettingBody extends StatelessWidget {
  const NotificationSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notification Settings",
          style: Styles.textStyle20.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Today",
                  style: Styles.textStyle14.copyWith(
                    color: AppColor.kSecondaryGray2Color,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CustomNotificationContainerItem(
                height: 133,
                width: 382,
                image: AssetsData.heartNotificationLogo,
                maxLines: 3,
                title: "Heart Rate Irregularity",
                notificationTime: "2h",
                description:
                    "Your blood pressure readings have been consistently high. Consider consulting your doctor.",
              ),
              const SizedBox(height: 16),
              const CustomNotificationContainerItem(
                height: 133,
                width: 382,
                maxLines: 3,
                image: AssetsData.symptomsNotificationLogo,
                title: "Log Your Symptoms",
                notificationTime: "2h",
                description:
                    "Don’t forget to log your symptoms today to help track your health progress.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
