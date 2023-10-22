import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../../data/source/remote/branches_data/branches_data.dart';

class AddBranchesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final BranchesData _branchesData = BranchesData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addBranches() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var branchModel = const BranchModel();
      var response = await _branchesData.addBranches(branchModel);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {}
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }
}
