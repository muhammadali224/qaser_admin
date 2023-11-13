import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/cash_user_model/cash_user_model.dart';
import '../../data/source/remote/cash_user_data/cash_user_data.dart';

class CashUserViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  List<CashUserModel> cashUserList = [];
  final CashUserData cashUsersData = CashUserData(Get.find());

  getCashUsers() async {
    try {
      cashUserList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await cashUsersData.getCashUsers();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          cashUserList
              .addAll(responseList.map((e) => CashUserModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteCashUser(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cashUsersData.deleteCashUser(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getCashUsers();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToAddCashUser() {
    Get.toNamed(AppRoutes.addCashUser);
  }

  goToEditCashUser(CashUserModel cashModel) {
    Get.toNamed(AppRoutes.editCashUser, arguments: {
      "cashModel": cashModel,
    });
  }

  @override
  void onInit() async {
    await getCashUsers();
    super.onInit();
  }
}
