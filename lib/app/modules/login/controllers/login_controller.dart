import 'package:e_tol/app/data/auth_provider.dart';
import 'package:e_tol/app/routes/app_pages.dart';
import 'package:e_tol/my_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    EasyLoading.show();
    AuthProvider().login({'email': email.text, 'password': password.text}).then(
        (Response response) {
      if (response.statusCode == 200) {
        box.write('token', response.body);
        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode == 401) {
        Get.snackbar("Warning", 'Incorrect email or password.',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (response.statusCode == null) {
        Get.snackbar("Warning", 'No internet connection.',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        Get.snackbar("Error", 'Server Error',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      EasyLoading.dismiss();
    });
  }
}
