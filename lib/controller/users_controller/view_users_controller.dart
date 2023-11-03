import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/users_model/users_model.dart';
import '../../data/source/remote/users_data/users_data.dart';

class UsersViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<UsersModel> usersList = [];
  final UsersData usersData = UsersData(Get.find());

  getUsers() async {
    try {
      usersList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await usersData.getUsers();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          usersList.addAll(responseList.map((e) => UsersModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  sortList() {
    usersList.sort((a, b) => a.usersName!.compareTo(b.usersName!));
    update();
  }

  deleteUser(int id, String imageName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.deleteUser(id.toString(), imageName);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getUsers();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToUserDetails(UsersModel userModel) {
    Get.toNamed(AppRoutes.editCoupon, arguments: {
      "model": userModel,
    });
  }

  @override
  void onInit() async {
    await getUsers();
    super.onInit();
  }
}
