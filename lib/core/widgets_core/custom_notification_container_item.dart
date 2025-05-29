import 'package:chronic_diseases/core/styles.dart';
import 'package:flutter/material.dart';
import '../app_color.dart';

class CustomNotificationContainerItem extends StatelessWidget {
  const CustomNotificationContainerItem({
    super.key,
    required this.title,
    required this.description,
    required this.height,
    required this.width,
    required this.image,
    required this.notificationTime,
    required this.maxLines,
  });

  final String title;
  final String description;
  final String notificationTime;
  final String image;
  final double height;
  final double width;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.kListTileBackGroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      notificationTime,
                      style: Styles.textStyle12.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(
                    color: AppColor.kBlackColor,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
