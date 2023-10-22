import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/branches_controller/branch_view_controller.dart';
import '../../../core/class/handling_data_view.dart';

class ViewBranches extends StatelessWidget {
  const ViewBranches({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BranchViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("branches".tr),
      ),
      body: GetBuilder<BranchViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.branchList.length,
              itemBuilder: (context, index) => Text(
                    controller.branchList[index].branchNameAr!,
                    style: const TextStyle(color: Colors.black),
                  )),
        ),
      ),
    );
  }
}
