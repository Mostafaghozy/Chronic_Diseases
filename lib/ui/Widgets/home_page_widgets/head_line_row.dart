import 'package:chronic_diseases/ui/screen/notification_page_view.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/app_color.dart';
import '../../../../../../../core/styles.dart';
import 'package:chronic_diseases/core/user_session.dart';

class HeadLineRow extends StatefulWidget {
  const HeadLineRow({super.key});

  @override
  State<HeadLineRow> createState() => _HeadLineRowState();
}

class _HeadLineRowState extends State<HeadLineRow> {
  String? username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final name = await UserSession.getUsername();
    setState(() {
      username = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "WELCOME BACK",
              style: Styles.textStyle12.copyWith(
                color: AppColor.kBlackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              username ?? "UNKNOWN PERSON",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationPageView(),
              ),
            );
          },
          child: const CircleAvatar(
            backgroundColor: AppColor.kWhiteColor,
            radius: 24,
            child: Icon(
              Icons.notifications_none_outlined,
              color: AppColor.kBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
