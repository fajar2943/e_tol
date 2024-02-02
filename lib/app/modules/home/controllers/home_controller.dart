import 'package:e_tol/app/data/topup_provider.dart';
import 'package:e_tol/app/routes/app_pages.dart';
import 'package:e_tol/my_storage.dart';
import 'package:e_tol/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeController extends GetxController {
  int page = 0;
  TextEditingController total = TextEditingController();
  RxList topupHistories = [].obs;
  RxString balance = ''.obs;
  RxString vehicle = ''.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  RxInt nextData = 2.obs;

  @override
  void onInit() {
    index();
    super.onInit();
  }

  void index() {
    EasyLoading.show();
    TopupProvider().getTopup().then((Response response) {
      if (response.statusCode == 200) {
        topupHistories.assignAll(response.body['topups']);
        balance.value = response.body['balance'];
        vehicle.value = response.body['vehicle'];
        nextData.value = response.body['next_data'];
      } else if (response.statusCode == 401) {
        box.erase();
        Get.offAllNamed(Routes.LOGIN);
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

  void topup() {
    EasyLoading.show();
    TopupProvider()
        .createTopup({'total': total.text}).then((Response response) {
      print(response.body);
      if (response.statusCode == 201) {
        payment(response.body);
      } else if (response.statusCode == 422) {
        Get.snackbar("Warning", response.body['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (response.statusCode == 401) {
        box.erase();
        Get.offAllNamed(Routes.LOGIN);
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

  void payment(token) {
    launcher.launchUrl(
      Uri.parse('${baseUrl}/payment/${token}'),
      mode: launcher.LaunchMode.externalApplication,
    );
  }

  void onLoading() {
    TopupProvider().nextData(nextData).then((Response response) {
      if (response.statusCode == 200) {
        for (var element in response.body['topups']) {
          topupHistories.add(element);
        }
        nextData.value = response.body['next_data'];
      }
    });
    refreshController.loadComplete();
  }
}
