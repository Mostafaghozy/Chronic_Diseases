import 'package:chronic_diseases/core/app_color.dart';
import 'package:chronic_diseases/core/assets.dart';
import 'package:chronic_diseases/core/styles.dart';
import 'package:chronic_diseases/core/widgets_core/custom_notification_container_item.dart';
import 'package:chronic_diseases/ui/Widgets/_home/notification_page_widgets/notification_setting_body.dart';
import 'package:flutter/material.dart';

class NotificationPageViewBody extends StatelessWidget {
  const NotificationPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Styles.textStyle20.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
                size: 20, color: Color(0xff33363F), Icons.settings_outlined),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NotificationSettingBody();
              }));
            },
          ),
        ],
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
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Yesterday",
                  style: Styles.textStyle14.copyWith(
                    color: AppColor.kSecondaryGray2Color,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CustomNotificationContainerItem(
                height: 151,
                width: 382,
                maxLines: 4,
                image: AssetsData.medicationNotificationLogo,
                title: "Time for Medication",
                notificationTime: "10h",
                description:
                    "It’s time to take your prescribed medication: Metformin 500mg ,Your medication for Diabetes is running low. Refill your prescription soon,",
              ),
              const SizedBox(height: 16),
              const CustomNotificationContainerItem(
                height: 133,
                width: 382,
                maxLines: 3,
                image: AssetsData.aiNotificationLogo,
                title: "AI-Powered Insight",
                notificationTime: "1d",
                description:
                    "Our analysis suggests you might benefit from increasing your daily fiber intake.",
              ),
              const SizedBox(height: 16),
              const CustomNotificationContainerItem(
                height: 133,
                width: 382,
                maxLines: 3,
                image: AssetsData.reinforcementNotificationLogo,
                title: "Positive Reinforcement",
                notificationTime: "2d",
                description:
                    "You’ve logged your symptoms daily for a week. Keep the streak alive!",
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
