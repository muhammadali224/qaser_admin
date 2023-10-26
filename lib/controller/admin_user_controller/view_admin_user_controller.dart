import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/source/remote/admin_users_data/admins_user_data.dart';
import '../../data/source/shared/branch_list.dart';

class AdminUserViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  List<AdminModel> adminUserList = [];
  final AdminUserData adminUsersData = AdminUserData(Get.find());

  getAdminUsers() async {
    try {
      adminUserList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await adminUsersData.getAdmin();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          adminUserList.addAll(responseList.map((e) => AdminModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteAdminUser(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminUsersData.deleteAdmins(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getAdminUsers();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToAddAdminUser() {
    Get.toNamed(AppRoutes.addAdminUser);
  }

  goToEditAdminUser(AdminModel adminModel) {
    Get.toNamed(AppRoutes.editAdminUser, arguments: {
      "adminModel": adminModel,
    });
  }

  String? getBranchName(int branchId) {
    return branchList
        .firstWhereOrNull((element) => branchId == element.branchId)
        ?.branchNameAr!;
  }

  @override
  void onInit() async {
    await userManagement.getUser();
    adminData = userManagement.user;
    await getAdminUsers();
    super.onInit();
  }
}
