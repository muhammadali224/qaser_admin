import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../../data/source/remote/branches_data/branches_data.dart';

class BranchViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  final BranchesData _branchesData = BranchesData(Get.find());
  List<BranchModel> branchList = [];

  getBranches() async {
    try {
      branchList.clear();
      statusRequest = StatusRequest.loading;
      update();

      var response = await _branchesData.getBranches(
        adminData.adminSuperAdmin.toString(),
        adminData.adminBranchId.toString(),
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          if (adminData.adminSuperAdmin == 1) {
            List responseList = response['data'];
            branchList.addAll(responseList.map((e) => BranchModel.fromJson(e)));
          } else if (adminData.adminSuperAdmin == 0) {
            var responseList = response['data'];
            final branchModel = BranchModel.fromJson(responseList);
            branchList.add(branchModel);
          }
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  @override
  void onInit() async {
    await userManagement.getUser();
    adminData = userManagement.user;

    await getBranches();
    super.onInit();
  }
}
