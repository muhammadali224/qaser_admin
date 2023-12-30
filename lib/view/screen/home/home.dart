import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/exit_alert.dart';
import '../../../core/function/pick_date.dart';
import '../../widget/home/home_branch_title.dart';
import '../../widget/home/home_pie.dart';
import '../app_drawer/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text("home".tr),
        actions: [
          IconButton(
              onPressed: () async {
                var selectedDate = await pickMonth(context);
                if (selectedDate != null) {
                  controller.getSummery(selectedDate);
                }
              },
              icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          exitAlert();
          return;
        },
        child: GetBuilder<HomeController>(builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.totalSummary.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => Column(
                children: [
                  HomeBranchTitle(
                      title: controller.totalSummary[index].branchNameAr!),
                  Text(
                      "${controller.totalSummary[index].orderMonth!}-${controller.totalSummary[index].orderYear!}"),
                  HomePie(totalModel: controller.totalSummary[index]),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
