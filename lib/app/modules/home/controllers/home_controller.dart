import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/modules/add/views/add_view.dart';
import 'package:flutter_get_cli_demo/app/modules/menu/views/menu_view.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/views/notifications_view.dart';
import 'package:get/get.dart';

import '../../search/views/search_view.dart';
import '../views/home_view.dart';

Map<int, Widget> tabViews = {
  0: HomeView(),
  1: SearchView(),
  2: AddView(),
  3: NotificationsView(),
  4: MenuView(),
};

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  Widget get currentView => currentIndex.value == 0
      ? Text('Home view is working')
      : tabViews[currentIndex.value] ?? Text('Home view is working');

  void onTap(int newIndex) {
    print('New index is $newIndex');
    currentIndex.value = newIndex;
    update();
  }
}
