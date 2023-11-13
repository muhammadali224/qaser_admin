import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../home_controller/home_controller.dart';

class BranchViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  HomeController homeController = Get.put(HomeController());

  deleteBranch(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeController.branchesData.deleteBranches(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        homeController.getBranches();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToAddBranch() {
    Get.toNamed(AppRoutes.addBranch);
  }

  goToEditBranch(BranchModel branchModel) {
    Get.toNamed(AppRoutes.editBranch, arguments: {
      "branchModel": branchModel,
    });
  }

  @override
  void onInit() async {
    await homeController.getBranches();
    super.onInit();
  }
}
