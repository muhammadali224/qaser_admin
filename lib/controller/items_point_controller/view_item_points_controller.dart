import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/model/items_point_model/items_point_model.dart';
import '../../data/source/remote/items_point_data/items_point_data.dart';

class ViewItemsPointController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsPointModel> itemsPointList = [];

  late CategoriesModel categoriesModel;
  final ItemsPointData itemsPointData = ItemsPointData(Get.find());

  Future<void> getItemsPoint() async {
    itemsPointList.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsPointData.getItemsPoint();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          itemsPointList
              .addAll(responseList.map((e) => ItemsPointModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.showToast(e.toString());
      throw Exception(e.toString());
    }

    update();
  }

  Future<void> updateActive(int state, int id) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemsPointData.updateActiveItemsPoint(
          state: state.toString(), id: id.toString());
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.showNotify(
              msg: "تم تعديل الحالة بنجاح", notifyType: NotifyType.success);
          await getItemsPoint();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.showToast(e.toString());
      throw Exception(e.toString());
    }

    update();
  }

  deleteItems(int id, String imageName) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await itemsPointData.deleteItemsPoint(id.toString(), imageName);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          SmartDialog.showToast("تم الحذف بنجاح");
          getItemsPoint();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  goToAddItemsPoint() {
    Get.toNamed(AppRoutes.addItemsPoint);
  }

  @override
  void onInit() async {
    await getItemsPoint();

    super.onInit();
  }
}
