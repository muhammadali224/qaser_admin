import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/extension/string_extension.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/items_point_model/items_point_model.dart';
import '../../data/source/remote/items_point_data/items_point_data.dart';

class AddItemsPointController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController startDate;
  late TextEditingController endDate;

  ItemsPointData itemsPointData = ItemsPointData(Get.find());

  File? file;
  String imageUrl = "";

  addItemWithImage() async {
    try {
      if (file != null && formKey.currentState!.validate()) {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var itemsPointModel = ItemsPointModel(
          itemsPointCount: int.parse(count.text),
          itemsPointName: nameEn.text,
          itemsPointNameAr: nameAr.text,
          itemsPointExpireDate: endDate.text.parseStringToDateTime(),
          itemsPointStartDate: startDate.text.parseStringToDateTime(),
          itemsPointPrice: num.parse(price.text),
        );
        var response = await itemsPointData.addItemsPointWithImage(
          itemsPointModel,
          file!,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.back();
          } else {
            statusRequest = StatusRequest.failed;
          }
        }
      } else {
        SmartDialog.showToast(
            "الرجاء التأكد من اختيار الصورة وتعبئة كافة المعلومات");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  // editAvailableInBranch(int branchId, bool val) async {
  //   try {
  //     SmartDialog.showLoading(msg: 'loading'.tr);
  //     var response = val == true
  //         ? await itemsViewController.itemsData.addToBranch(
  //             branchId,
  //             itemsModel!.itemsId!,
  //           )
  //         : await itemsViewController.itemsData.removeFromBranch(
  //             branchId,
  //             itemsModel!.itemsId!,
  //           );
  //     statusRequest = handlingData(response);
  //     if (statusRequest == StatusRequest.success) {
  //       if (response["status"] == "success") {
  //         SmartDialog.dismiss();
  //         SmartDialog.showNotify(
  //             msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
  //         var responseList = response["data"][0];
  //         itemsModel = ItemsModel.fromJson(responseList);
  //       }
  //     } else {
  //       statusRequest = StatusRequest.failed;
  //     }
  //   } catch (e) {
  //     SmartDialog.dismiss();
  //     SmartDialog.showToast(e.toString());
  //     throw Exception(e.toString());
  //   }
  //   update();
  // }

  initData() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    startDate = TextEditingController();
    endDate = TextEditingController();
  }

  @override
  void onInit() {
    try {
      initData();
    } catch (e) {
      throw Exception(e.toString());
    }

    super.onInit();
  }

  @override
  void dispose() {
    nameAr.dispose();
    nameEn.dispose();
    startDate.dispose();
    endDate.dispose();
    count.dispose();
    price.dispose();
    super.dispose();
  }
}
