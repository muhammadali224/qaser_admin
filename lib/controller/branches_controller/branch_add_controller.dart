import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../home_controller/home_controller.dart';

class AddBranchesController extends GetxController {
  bool isEdit = false;
  BranchModel? branchModel;
  StatusRequest statusRequest = StatusRequest.none;
  HomeController homeController = Get.put(HomeController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  late TextEditingController phone1;
  late TextEditingController phone2;
  late TextEditingController facebookUrl;
  late TextEditingController deleveryCharge;
  late TextEditingController deleveryStart;
  late TextEditingController deleveryMaxZone;
  late TextEditingController deliverFixCharge;
  late TextEditingController deliveryFixZone;
  int selectedOption = 0;
  double? longitude;
  double? latitude;

  void setIsEdit(bool value) {
    isEdit = value;
  }

  addBranches() async {
    try {
      if (longitude == null || latitude == null) {
        SmartDialog.showNotify(
            msg: "الرجاء اختيار موقع", notifyType: NotifyType.error);
      }
      if (formKey.currentState!.validate() &&
          (longitude != null || latitude != null)) {
        try {
          statusRequest = StatusRequest.loading;
          update();
          var branchModel = BranchModel(
              branchNameAr: nameAr.text,
              branchNameEn: nameEn.text,
              branchLang: longitude,
              branchLat: latitude,
              branchIsFixed: selectedOption,
              branchIsOpen: 0,
              branchMaxZone: num.parse(deleveryMaxZone.text),
              branchDeliveryCharge: num.parse(deleveryCharge.text),
              branchFacebookUrl: facebookUrl.text,
              branchPhone1: phone1.text,
              branchPhone2: phone2.text,
              branchDeliveryFixCharge: num.parse(deliverFixCharge.text),
              branchStartDelivery: num.parse(deleveryStart.text),
              branchZone: num.parse(deliveryFixZone.text));
          var response =
              await homeController.branchesData.addBranches(branchModel);
          statusRequest = handlingData(response);
          if (statusRequest == StatusRequest.success) {
            if (response["status"] == "success") {
              SmartDialog.showNotify(
                  msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
              Get.offAndToNamed(AppRoutes.branches);
              homeController.getBranches();
            }
          } else {
            statusRequest = StatusRequest.failed;
          }
        } catch (e) {
          SmartDialog.showToast(e.toString());
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  editBranches() async {
    try {
      if (longitude == null || latitude == null) {
        SmartDialog.showNotify(
            msg: "الرجاء اختيار موقع", notifyType: NotifyType.error);
      }
      if (formKey.currentState!.validate() &&
          (longitude != null || latitude != null)) {
        try {
          statusRequest = StatusRequest.loading;
          update();
          var branchEditModel = BranchModel(
              branchNameAr: nameAr.text,
              branchNameEn: nameEn.text,
              branchLang: longitude,
              branchLat: latitude,
              branchIsFixed: selectedOption,
              branchIsOpen: 0,
              branchMaxZone: num.parse(deleveryMaxZone.text),
              branchDeliveryCharge: num.parse(deleveryCharge.text),
              branchFacebookUrl: facebookUrl.text,
              branchPhone1: phone1.text,
              branchPhone2: phone2.text,
              branchDeliveryFixCharge: num.parse(deliverFixCharge.text),
              branchStartDelivery: num.parse(deleveryStart.text),
              branchZone: num.parse(deliveryFixZone.text));
          var response = await homeController.branchesData
              .editBranches(branchEditModel, branchModel!.branchId.toString());
          statusRequest = handlingData(response);
          if (statusRequest == StatusRequest.success) {
            if (response["status"] == "success") {
              SmartDialog.showNotify(
                  msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
              Get.offAndToNamed(AppRoutes.branches);
              homeController.getBranches();
            }
          } else {
            statusRequest = StatusRequest.failed;
          }
        } catch (e) {
          SmartDialog.showToast(e.toString());
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  goToAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  void onChanged(int? val) {
    selectedOption = val!;
    if (val == 0) {
      deliverFixCharge.text = "0.0";
      deliveryFixZone.text = "0.0";
    }
    update();
  }

  initData() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();
    phone1 = TextEditingController();
    phone2 = TextEditingController();
    facebookUrl = TextEditingController();
    deleveryCharge = TextEditingController();
    deleveryMaxZone = TextEditingController();
    deliverFixCharge = TextEditingController();
    deliveryFixZone = TextEditingController();
    deleveryStart = TextEditingController();
    if (selectedOption == 0) {
      deliverFixCharge.text = "0.0";
      deliveryFixZone.text = "0.0";
    }
  }

  initEditData(BranchModel branchModel) {
    nameAr = TextEditingController(text: branchModel.branchNameAr);
    nameEn = TextEditingController(text: branchModel.branchNameEn);
    phone1 = TextEditingController(text: branchModel.branchPhone1);
    phone2 = TextEditingController(text: branchModel.branchPhone2);
    facebookUrl = TextEditingController(text: branchModel.branchFacebookUrl);
    deleveryCharge = TextEditingController(
        text: branchModel.branchDeliveryCharge.toString());
    deleveryStart =
        TextEditingController(text: branchModel.branchStartDelivery.toString());
    deleveryMaxZone =
        TextEditingController(text: branchModel.branchMaxZone.toString());
    deliverFixCharge = TextEditingController(
        text: branchModel.branchDeliveryFixCharge.toString());
    deliveryFixZone =
        TextEditingController(text: branchModel.branchZone.toString());
    selectedOption = branchModel.branchIsFixed!.toInt();
    latitude = branchModel.branchLat;
    longitude = branchModel.branchLang;
  }

  @override
  void onInit() {
    try {
      if (Get.currentRoute == "/editBranch") {
        branchModel = Get.arguments['branchModel'];
        setIsEdit(true);
        initEditData(branchModel!);
      } else if (Get.currentRoute == "/addBranch") {
        initData();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    super.onInit();
  }

  @override
  void dispose() {
    nameAr.dispose();
    nameEn.dispose();
    phone1.dispose();
    phone2.dispose();
    facebookUrl.dispose();
    deleveryCharge.dispose();
    deleveryMaxZone.dispose();
    deliverFixCharge.dispose();
    deliveryFixZone.dispose();
    deleveryStart.dispose();
    super.dispose();
  }
}
