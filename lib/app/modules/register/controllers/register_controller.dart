import 'package:e_tol/app/data/auth_provider.dart';
import 'package:e_tol/app/routes/app_pages.dart';
import 'package:e_tol/my_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void register() {
    EasyLoading.show();
    var data = {
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'password_confirmation': password_confirmation.text,
    };
    AuthProvider().register(data).then((Response response) {
      if (response.statusCode == 201) {
        box.write('token', response.body);
        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode == 422) {
        Get.snackbar("Warning", response.body['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (response.statusCode == null) {
        Get.snackbar("Warning", 'No internet connection!',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        Get.snackbar("Error", 'Server Error',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      EasyLoading.dismiss();
    });
  }
}
