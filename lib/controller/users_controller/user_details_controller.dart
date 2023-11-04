import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/pop_menu_model/pop_menu_model.dart';
import '../../data/model/users_model/users_model.dart';
import '../../data/source/remote/users_data/users_data.dart';

class UserDetailsController extends GetxController {
  UsersModel? userModel;
  List<PopMenuModel> optionMenu = [];
  final UsersData usersData = UsersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  selectOptionList(String val) async {
    switch (val) {
      case "1":
        await editUserDetails(1);
        break;
      case "2":
        await editUserDetails(userModel!.usersApprove == 2 ? 1 : 2);
        break;
    }

    update();
  }

  editUserDetails(int userState) async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response =
          await usersData.changeUserState(userModel!.usersId!, userState);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
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
    userModel = Get.arguments["model"];
    optionMenu.add(
      PopMenuModel(
          name: userModel!.usersApprove == 2
              ? "إلغاء حظر المستخدم"
              : "حظر المستخدم",
          value: "2",
          icon: Icons.no_accounts),
    );
    if (userModel!.usersApprove == 0) {
      optionMenu.add(PopMenuModel(
          name: "تفعيل", value: "1", icon: Icons.verified_user_rounded));
    }
    super.onInit();
  }
}
