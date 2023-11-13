import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../../data/source/remote/branches_data/branches_data.dart';
import '../../data/source/shared/branch_list.dart';

class BranchViewController extends GetxController {
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  StatusRequest statusRequest = StatusRequest.none;
  final BranchesData branchesData = BranchesData(Get.find());

  getBranches() async {
    branchList.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await branchesData.getBranches(
        adminData.adminSuperAdmin.toString(),
        adminData.adminBranchId.toString(),
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          branchList.addAll(responseList.map((e) => BranchModel.fromJson(e)));
          print(branchList.toString());
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteBranch(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await branchesData.deleteBranches(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getBranches();
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
    await userManagement.getUser();
    adminData = userManagement.user;
    await getBranches();

    super.onInit();
  }
}
