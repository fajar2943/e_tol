import 'package:e_tol/my_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  var initial_route = Routes.LOGIN;
  if (box.read('token') != null) {
    initial_route = Routes.HOME;
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: initial_route,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}
