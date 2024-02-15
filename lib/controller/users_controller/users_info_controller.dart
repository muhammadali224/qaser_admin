import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/source/remote/users_data/users_data.dart';

class UsersInfoController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UsersData usersData = UsersData(Get.find());
  RxInt totalUser = 0.obs;
  RxInt totalActiveUser = 0.obs;

  getUsersInfo() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await usersData.getUsersInfo();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          totalUser.value = response['total_users'];
          totalActiveUser.value = response['total_active_users'];
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    getUsersInfo();
    super.onInit();
  }
}
