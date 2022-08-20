import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/core/values/colors.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/controllers/notifications_controller.dart';

import 'package:get/get.dart';

class TabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabItem(
                  title: "General",
                  isSelected: controller.isActiveNotificationTab("General"),
                  onTap: controller.changeActiveNotificationTab,
                ),
                TabItem(
                  title: "Messages",
                  isSelected: controller.isActiveNotificationTab("Messages"),
                  onTap: controller.changeActiveNotificationTab,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Messages",
                        style: textStyle(),
                      ),
                      SizedBox(width: 2),
                      Badge(count: 9),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function(String value) onTap;
  final Widget? child;

  const TabItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: kSecondary,
                    width: 4,
                  ),
                )
              : null,
        ),
        child: child ??
            Text(
              title,
              style: textStyle(),
            ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final int count;
  const Badge({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: textStyle().copyWith(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 18.0,
  );
}
