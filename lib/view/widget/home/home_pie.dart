import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../data/model/total_model/total_model.dart';
import '../users/pie_chart.dart';

class HomePie extends GetView<HomeController> {
  final TotalModel totalModel;

  const HomePie({required this.totalModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          UserPieChart(
            centerText: "العدد ${totalModel.ordersCount}",
            dataMap: {
              "التوصيل": totalModel.deliveryOrdersCount!.toDouble(),
              "الاستلام": totalModel.pickupOrdersCount!.toDouble(),
            },
            totalValue: totalModel.ordersCount!.toDouble(),
            colorList: const [
              Colors.green,
              Colors.red,
            ],
          ),
          UserPieChart(
            centerText: "السعر ${totalModel.totalsPrice}",
            dataMap: {
              "التوصيل": totalModel.deliveryOrdersPrice!.toDouble(),
              "الاستلام": totalModel.pickupOrdersPrice!.toDouble(),
            },
            totalValue: totalModel.totalsPrice!.toDouble(),
            colorList: const [
              Colors.blue,
              Colors.orange,
            ],
          ),
        ],
      ),
    );
  }
}
