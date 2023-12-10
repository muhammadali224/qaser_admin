import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/pick_image.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/sub_items/sub_items_model.dart';
import '../../data/source/remote/items_data/items_data.dart';
import '../../view/widget/items/items_details/show_modal_branch_list.dart';
import 'view_items_controller.dart';

class ItemsDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ItemsModel? itemModel;
  final ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<SubItemsModel> subItemsList = [];
  TextEditingController price = TextEditingController();
  ViewItemController viewItemController = Get.find<ViewItemController>();

  File? file;
  late TabController tabController;

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
          if (val == true) Get.back();
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
          ? await itemsData.addItemWeight(
              weightId, itemModel!.itemsId!, price.text)
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

  addItemImage() async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = await itemsData.addItemImage(itemModel!.itemsId!, file!);
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
      print(e.toString());
    }
    update();
  }

  deleteItemImage(String imageName) async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response =
          await itemsData.removeItemImage(itemModel!.itemsId!, imageName);
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
      print(e.toString());
    }
    update();
  }

  getSubItem() async {
    try {
      subItemsList.clear();
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = await itemsData.getSubItems(itemModel!.itemsId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          List responseList = response['data'];
          subItemsList
              .addAll(responseList.map((e) => SubItemsModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.dismiss();
      print(e.toString());
    }
    SmartDialog.dismiss();
    update();
  }

  getFloatingAction() async {
    if (tabController.index == 0) {
      print("0");
    } else if (tabController.index == 1) {
      showCustomModalSheet(Get.context!, editAvailableInBranch);
    } else if (tabController.index == 2) {
      file = await pickImage(ImageSource.gallery);
      if (file != null) {
        addItemImage();
      }
    }
  }

  @override
  void onInit() async {
    itemModel = Get.arguments['model'];
    tabController = TabController(length: 3, vsync: this);
    await getSubItem();
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
