import 'package:e_tol/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vehicle_controller.dart';

class VehicleView extends GetView<VehicleController> {
  const VehicleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(controller: controller),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: controller.vehicles.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    controller.vehicles[index]['image'].toString(),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "${controller.vehicles[index]['name']}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "${controller.vehicles[index]['number']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
