import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/source/remote/admin_users_data/admins_user_data.dart';
import 'view_admin_user_controller.dart';

class AddEditAdminUserController extends GetxController {
  bool isEdit = false;
  AdminModel? adminModel;
  StatusRequest statusRequest = StatusRequest.none;
  AdminUserViewController adminUserViewController =
      Get.put(AdminUserViewController());
  AdminUserData adminUserData = AdminUserData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameAr;
  late TextEditingController email;
  late TextEditingController password;
  int selectedBranch = 0;
  int isSuperAdmin = 0;

  void setIsEdit(bool value) {
    isEdit = value;
  }

  addAdminUser() async {
    if (formKey.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        var adminModels = AdminModel(
          adminName: nameAr.text,
          adminEmail: email.text,
          adminBranchId: selectedBranch,
          adminPassword: password.text,
          adminSuperAdmin: isSuperAdmin,
        );
        var response = await adminUserData.addAdmins(adminModels);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.adminUser);
            adminUserViewController.getAdminUsers();
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
        statusRequest = StatusRequest.loading;
        update();
        var adminEditModel = AdminModel(
            adminName: nameAr.text,
            adminEmail: email.text,
            adminBranchId: selectedBranch,
            adminPassword: password.text,
            adminSuperAdmin: isSuperAdmin);
        var response = await adminUserData.editAdmins(
            adminEditModel, adminModel!.adminId.toString());
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.adminUser);
            adminUserViewController.getAdminUsers();
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
  }

  initEditData(AdminModel adminModels) {
    nameAr = TextEditingController(text: adminModels.adminName);
    email = TextEditingController(text: adminModels.adminEmail);
    password = TextEditingController();
    selectedBranch = adminModels.adminBranchId!;
    isSuperAdmin = adminModels.adminSuperAdmin!;
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
