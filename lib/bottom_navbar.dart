import 'package:e_tol/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        if (index == 0) {
          Get.offAllNamed(Routes.HOME);
        } else if (index == 1) {
          Get.offAllNamed(Routes.VEHICLE);
        } else if (index == 2) {
          Get.offAllNamed(Routes.PROFILE);
        }
      },
      indicatorColor: Colors.amber,
      selectedIndex: controller.page,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.car_crash_outlined),
          label: 'Vehicle',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
