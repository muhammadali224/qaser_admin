import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/users_controller/users_info_controller.dart';
import '../../../core/class/handling_data_view.dart';

class UsersInfo extends StatelessWidget {
  const UsersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersInfoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات المستخدمين'),
      ),
      body: GetBuilder<UsersInfoController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "عدد المستخدمين الكلي",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(controller.totalUser.value.toString(),
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "عدد المستخدمين المفعلين",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        controller.totalActiveUser.value.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        );
      }),
    );
  }
}
