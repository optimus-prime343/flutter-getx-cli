import 'package:get/get.dart';

import 'package:flutter_get_cli_demo/app/modules/add/bindings/add_binding.dart';
import 'package:flutter_get_cli_demo/app/modules/add/views/add_view.dart';
import 'package:flutter_get_cli_demo/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_get_cli_demo/app/modules/home/views/home_view.dart';
import 'package:flutter_get_cli_demo/app/modules/menu/bindings/menu_binding.dart';
import 'package:flutter_get_cli_demo/app/modules/menu/views/menu_view.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/bindings/notifications_binding.dart';
import 'package:flutter_get_cli_demo/app/modules/notifications/views/notifications_view.dart';
import 'package:flutter_get_cli_demo/app/modules/search/bindings/search_binding.dart';
import 'package:flutter_get_cli_demo/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
  ];
}
