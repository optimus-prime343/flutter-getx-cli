import 'package:flutter/material.dart';
import 'package:flutter_get_cli_demo/app/core/values/colors.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackground,
        primarySwatch: kPrimarySwatch,
      ),
    ),
  );
}
