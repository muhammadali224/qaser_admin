import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/get_branch_name.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/admin_model/admin_model.dart';
import 'view_admin_user_controller.dart';

class AddEditAdminUserController extends GetxController {
  bool isEdit = false;
  bool isVisiblePassword = true;
  AdminModel? adminModel;
  StatusRequest statusRequest = StatusRequest.none;
  AdminUserViewController adminUserViewController =
      Get.put(AdminUserViewController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController email;
  late TextEditingController password;
  int selectedBranch = 1;
  int isSuperAdmin = 0;
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
    print(val);
  }

  addAdminUser() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var adminModels = AdminModel(
          adminName: nameAr.text,
          adminEmail: email.text,
          adminBranchId: selectedBranch,
          adminPassword: password.text,
          adminSuperAdmin: isSuperAdmin,
        );
        var response =
            await adminUserViewController.adminUsersData.addAdmins(adminModels);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.adminUser);
            adminUserViewController.getAdminUsers();
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

  editAdminsUser() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var adminEditModel = AdminModel(
            adminName: nameAr.text,
            adminEmail: email.text,
            adminBranchId: selectedBranch,
            adminPassword: password.text,
            adminSuperAdmin: isSuperAdmin);

        var response = await adminUserViewController.adminUsersData
            .editAdmins(adminEditModel, adminModel!.adminId.toString());
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.adminUser);
            adminUserViewController.getAdminUsers();
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

  void onChanged(int? val) {
    isSuperAdmin = val!;

    update();
  }

  initData() {
    nameAr = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    dropDownValue = getBranchName(1)!;
  }

  initEditData(AdminModel adminModels) {
    nameAr = TextEditingController(text: adminModels.adminName);
    email = TextEditingController(text: adminModels.adminEmail);
    password = TextEditingController();
    selectedBranch = adminModels.adminBranchId!;
    isSuperAdmin = adminModels.adminSuperAdmin!;
    dropDownValue = getBranchName(selectedBranch)!;
  }

  @override
  void onInit() {
    if (Get.currentRoute == "/editAdminUser") {
      adminModel = Get.arguments['adminModel'];
      setIsEdit(true);
      initEditData(adminModel!);
    } else if (Get.currentRoute == "/addAdminUser") {
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
