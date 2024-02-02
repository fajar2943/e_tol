import 'package:e_tol/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(controller: controller),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Obx(
                        () => Text(
                          "${controller.balance.value}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Vehicles",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Obx(
                        () => Text(
                          "${controller.vehicle.value}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Topup Histories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Text("Topup"),
                            contentPadding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            children: [
                              Column(
                                children: [
                                  TextFormField(
                                    controller: controller.total,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: Text("Jumlah Topup"),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.topup();
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text("Topup Sekarang"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Topup"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                )),
            Obx(
              () => Expanded(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  enablePullDown: false,
                  enablePullUp: (controller.nextData.value > 0) ? true : false,
                  onLoading: () => controller.onLoading(),
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            controller.payment(controller.topupHistories[index]
                                ['payment_token']);
                            Get.back();
                          },
                          title: Text(
                              "${controller.topupHistories[index]['inv_no']}"),
                          subtitle: Text(
                              "${controller.topupHistories[index]['total']}"),
                          trailing: Text(
                              "${controller.topupHistories[index]['status']}"),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                      itemCount: controller.topupHistories.length),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
