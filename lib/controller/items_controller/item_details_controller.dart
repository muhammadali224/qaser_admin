import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/items_data/items_data.dart';
import 'view_items_controller.dart';

class ItemsDetailsController extends GetxController {
  ItemsModel? itemModel;
  final ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  ViewItemController viewItemController = Get.find<ViewItemController>();
  bool branchIsExpanded = false;
  bool weightIsExpanded = false;
  bool imagesIsExpanded = false;

  changeExpanded(int index) {
    switch (index) {
      case 0:
        branchIsExpanded = !branchIsExpanded;
        break;
      case 1:
        weightIsExpanded = !weightIsExpanded;
        break;
      case 2:
        imagesIsExpanded = !imagesIsExpanded;
        break;
    }

    update();
  }

  changeWeightExpanded() {
    weightIsExpanded = !weightIsExpanded;
    update();
  }

  changeImagesExpanded() {
    imagesIsExpanded = !imagesIsExpanded;
    update();
  }

  editAvailableInBranch(int branchId, bool val) async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = val == true
          ? await itemsData.addToBranch(branchId, itemModel!.itemsId!)
          : await itemsData.removeFromBranch(branchId, itemModel!.itemsId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
          var responseList = response["data"][0];
          itemModel = ItemsModel.fromJson(responseList);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialog.showToast(e.toString());
    }
    update();
  }

  editAvailableWeight(int weightId, bool val) async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = val == true
          ? await itemsData.addItemWeight(weightId, itemModel!.itemsId!)
          : await itemsData.removeItemWeight(weightId, itemModel!.itemsId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
          var responseList = response["data"][0];
          itemModel = ItemsModel.fromJson(responseList);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialog.showToast(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    itemModel = Get.arguments['model'];
    super.onInit();
  }
}
