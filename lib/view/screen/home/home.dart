import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/exit_alert.dart';
import '../app_drawer/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text("home".tr),
      ),
      body: WillPopScope(
        onWillPop: () => exitAlert(),
        child: GetBuilder<HomeController>(builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          );
        }),
      ),
    );
  }
}
