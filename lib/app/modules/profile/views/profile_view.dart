import 'package:e_tol/app/routes/app_pages.dart';
import 'package:e_tol/bottom_navbar.dart';
import 'package:e_tol/my_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(controller: controller),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            box.erase();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: Text("Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
