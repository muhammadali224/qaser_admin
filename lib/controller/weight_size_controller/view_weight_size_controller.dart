import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/weight_size_model/weight_size_model.dart';
import '../../data/source/remote/weight_size_data/weight_size_data.dart';
import '../../data/source/shared/sub_item_weight_list.dart';

class WeightSizeViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;

  final SubItemsData subItemsData = SubItemsData(Get.find());

  getSubItems() async {
    try {
      subItemsList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await subItemsData.getSubItems();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          subItemsList
              .addAll(responseList.map((e) => WeightSizeModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteSubItem(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await subItemsData.deleteSubItems(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getSubItems();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToAddSubItem() {
    Get.toNamed(AppRoutes.addWeightSize);
  }

  goToEditSubItem(WeightSizeModel weightModel) {
    Get.toNamed(AppRoutes.editWeightSize, arguments: {
      "model": weightModel,
    });
  }

  @override
  void onInit() async {
    await userManagement.getUser();
    adminData = userManagement.user;
    await getSubItems();
    super.onInit();
  }
}
