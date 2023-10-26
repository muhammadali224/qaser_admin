import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/get_branch_name.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/cash_user_model/cash_user_model.dart';
import 'view_cash_user_controller.dart';

class AddEditCashUserController extends GetxController {
  bool isEdit = false;
  bool isVisiblePassword = true;
  CashUserModel? cashModel;
  StatusRequest statusRequest = StatusRequest.none;
  CashUserViewController cashViewController = Get.put(CashUserViewController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController email;
  late TextEditingController password;
  int selectedBranch = 1;

  late String dropDownValue;

  void setIsEdit(bool value) {
    isEdit = value;
  }

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  onDropChanged(String? val) {
    selectedBranch = int.parse(val!);
    dropDownValue = getBranchName(selectedBranch)!;
    update();
  }

  addCashUser() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var adminModels = CashUserModel(
          cashUserName: nameAr.text,
          cashUserEmail: email.text,
          cashBranchId: selectedBranch,
          cashUserPassword: password.text,
        );
        var response =
            await cashViewController.cashUsersData.addCashUser(adminModels);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.adminUser);
            cashViewController.getCashUsers();
          } else if (response["status"] == "failed" &&
              response["message"] == "Email is Exists") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
              msg: "emailUsed".tr,
              maskColor: Colors.red,
              notifyType: NotifyType.alert,
            );
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

  editCashUser() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var cashEditModel = CashUserModel(
            cashUserName: nameAr.text,
            cashUserEmail: email.text,
            cashBranchId: selectedBranch,
            cashUserPassword: password.text);

        var response = await cashViewController.cashUsersData
            .editCashUser(cashEditModel, cashModel!.cashSystemId.toString());
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.cashUser);
            cashViewController.getCashUsers();
          } else if (response["status"] == "failed" &&
              response["message"] == "Email is Exists") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
              msg: "emailUsed".tr,
              maskColor: Colors.red,
              notifyType: NotifyType.alert,
            );
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
    email = TextEditingController();
    password = TextEditingController();

    dropDownValue = getBranchName(1)!;
  }

  initEditData(CashUserModel cashModels) {
    nameAr = TextEditingController(text: cashModels.cashUserName);
    email = TextEditingController(text: cashModels.cashUserEmail);
    password = TextEditingController();
    selectedBranch = cashModels.cashBranchId!;
    dropDownValue = getBranchName(selectedBranch)!;
  }

  @override
  void onInit() {
    if (Get.currentRoute == "/editCashUser") {
      cashModel = Get.arguments['cashModel'];
      setIsEdit(true);
      initEditData(cashModel!);
    } else if (Get.currentRoute == "/addCashUser") {
      initData();
    }
    super.onInit();
  }

  @override
  void dispose() {
    nameAr.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
