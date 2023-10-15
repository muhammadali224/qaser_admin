import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_details_controller.dart';
import '../../../core/function/translate_database.dart';

class OrderTableDetails extends GetView<OrderDetailsController> {
  const OrderTableDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          controller.data.length,
          (index) => Column(
            children: [
              ListTile(
                isThreeLine: true,
                title: Text(
                    "${translateDatabase(controller.data[index].itemsNameAr!, controller.data[index].itemsName!)}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                subtitle: Text(controller.data[index].cartItemNote!,
                    style:
                        TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                leading: Column(
                  children: [
                    Text("X${controller.data[index].countitems!}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(controller.data[index].cartItemPrice.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: Text(controller.data[index].itemsprice.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              if (index != controller.data.length - 1) const Divider(),
            ],
          ),
        )
      ],
    );
  }
}
