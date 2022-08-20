import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/global_widgets/bottom_navigation_bar.dart';
import 'package:flutter_get_cli_demo/app/global_widgets/custom_app_bar.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: homeController.currentIndex.value,
              onTap: homeController.onTap,
            ),
            body: Column(
              children: [
                CustomAppBar(),
                Expanded(
                  child: Center(
                    child: homeController.currentView,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
