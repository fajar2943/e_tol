import 'package:get/get.dart';

class HomeController extends GetxController {
  int page = 0;
  List topupHistories = [
    {'inv_no': 'INV001', 'total': 10000, 'status': 'Unpaid'},
    {'inv_no': 'INV002', 'total': 20000, 'status': 'Paid'},
    {'inv_no': 'INV003', 'total': 30000, 'status': 'Paid'},
    {'inv_no': 'INV004', 'total': 40000, 'status': 'Paid'},
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
