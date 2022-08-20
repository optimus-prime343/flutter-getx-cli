import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/core/values/colors.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/views/general_view.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/views/message_view.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/views/tab_view.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                controller.activeNotificationTabValue,
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            TabView(),
            Expanded(
              child: controller.activeNotificationTab.value == "General"
                  ? GeneralView()
                  : MessageView(),
            )
          ],
        );
      },
    );
  }
}
