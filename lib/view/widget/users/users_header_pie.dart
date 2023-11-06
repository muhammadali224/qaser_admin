import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/user_details_controller.dart';
import 'pie_chart.dart';

class UserHeaderPie extends GetView<UserDetailsController> {
  const UserHeaderPie({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          UserPieChart(
            centerText: "العدد ${controller.userModel!.ordersCount}",
            dataMap: controller.mapCount,
            totalValue: controller.userModel!.ordersCount!.toDouble(),
            colorList: const [
              Colors.green,
              Colors.red,
            ],
          ),
          UserPieChart(
              centerText: "السعر ${controller.userModel!.totalsPrice}",
              dataMap: controller.mapPrice,
              totalValue: controller.userModel!.totalsPrice!.toDouble(),
              colorList: const [
                Colors.blue,
                Colors.orange,
              ]),
        ],
      ),
    );
  }
}
