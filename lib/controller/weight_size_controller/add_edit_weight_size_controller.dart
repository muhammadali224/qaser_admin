import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/weight_size_model/weight_size_model.dart';
import 'view_weight_size_controller.dart';

class AddEditWeightSizeController extends GetxController {
  bool isEdit = false;

  WeightSizeModel? weightModel;
  StatusRequest statusRequest = StatusRequest.none;
  WeightSizeViewController weightViewController =
      Get.put(WeightSizeViewController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  late TextEditingController val;

  void setIsEdit(bool value) {
    isEdit = value;
  }

  addWeightSize() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var weightModel = WeightSizeModel(
          subItemNameAr: nameAr.text,
          subItemName: nameEn.text,
          subItemValue: num.parse(val.text),
        );
        var response =
            await weightViewController.subItemsData.addSubItem(weightModel);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.weightSize);
            weightViewController.getSubItems();
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    }
    update();
  }

  editSubItem() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var weightEditModel = WeightSizeModel(
            subItemNameAr: nameAr.text,
            subItemName: nameEn.text,
            subItemValue: num.parse(val.text));

        var response = await weightViewController.subItemsData.editSubItem(
          weightEditModel,
          weightModel!.weightSizeId.toString(),
        );
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.weightSize);
            weightViewController.getSubItems();
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    }
    update();
  }

  initData() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();
    val = TextEditingController();
  }

  initEditData(WeightSizeModel weightModel) {
    nameAr = TextEditingController(text: weightModel.subItemNameAr);
    nameEn = TextEditingController(text: weightModel.subItemName);
    val = TextEditingController(text: weightModel.subItemValue.toString());
  }

  @override
  void onInit() {
    if (Get.currentRoute == "/editWeightSize") {
      weightModel = Get.arguments['model'];
      setIsEdit(true);

      initEditData(weightModel!);
    } else if (Get.currentRoute == "/addWeightSize") {
      initData();
    }
    super.onInit();
  }

  @override
  void dispose() {
    nameAr.dispose();
    nameEn.dispose();
    val.dispose();
    super.dispose();
  }
}
