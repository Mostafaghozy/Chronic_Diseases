import 'package:chronic_diseases/core/widgets_core/custom_item_list_tile.dart';

import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/account_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/appearance_display_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/health_data_and_reports_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/help_and_support_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/language_and_region_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/notifications_view_body.dart';
import 'package:chronic_diseases/ui/Widgets/profile_page_widgets/privacy_and_security_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';

class ProfilePageListTileItems extends StatelessWidget {
  const ProfilePageListTileItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: 332,
          height: 272,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.kListTileBackGroundColor,
          ),
          child: Column(
            children: [
              CustomItemListTile(
                title: "Account",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AccountViewBody(),
                    ),
                  );
                },
                icon: Icons.lock_outline_rounded,
              ),
              CustomItemListTile(
                title: "Appearance & Display",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppearanceDisplayViewBody(),
                    ),
                  );
                },
                icon: Icons.mode_night,
              ),
              CustomItemListTile(
                title: "Notifications",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsViewBody(),
                    ),
                  );
                },
                icon: Icons.notifications_none_outlined,
              ),
              CustomItemListTile(
                title: "Health Data & Reports",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const HealthDataAndReportsViewBody(),
                    ),
                  );
                },
                icon: Icons.waterfall_chart,
              ),
            ],
          ),
        ),
        const SizedBox(height: 19),
        Container(
          alignment: Alignment.topCenter,
          width: 332,
          height: 204,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.kListTileBackGroundColor,
          ),
          child: Column(
            children: [
              CustomItemListTile(
                title: "Privacy & Security",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyAndSecurityViewBody(),
                    ),
                  );
                },
                icon: Icons.shield_outlined,
              ),
              CustomItemListTile(
                title: "Language & Region",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LanguageAndRegionViewBody(),
                    ),
                  );
                },
                icon: Icons.language_outlined,
              ),
              CustomItemListTile(
                title: "Help & Support",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HelpAndSupportViewBody(),
                    ),
                  );
                },
                icon: Icons.info_outline_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
