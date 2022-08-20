import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/core/values/bottom_navigation_items.dart';
import 'package:flutter_get_cli_demo/app/core/values/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int value) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      onTap: onTap,
      items: navigationItems
          .map(
            (navigationItem) => BottomNavigationBarItem(
              backgroundColor: kPrimary,
              icon: Icon(navigationItem.icon),
              label: navigationItem.label,
            ),
          )
          .toList(),
    );
  }
}
