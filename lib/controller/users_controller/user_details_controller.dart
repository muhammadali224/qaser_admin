import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/show_modal_sheet.dart';
import '../../data/model/pop_menu_model/pop_menu_model.dart';
import '../../data/model/users_model/users_model.dart';
import '../../data/source/remote/users_data/users_data.dart';
import '../../view/widget/users/send_notification_container.dart';

class UserDetailsController extends GetxController {
  UsersModel? userModel;
  List<PopMenuModel> optionMenu = [];
  final UsersData usersData = UsersData(Get.find());
  num pointCount = 0.0;
  StatusRequest statusRequest = StatusRequest.none;
  Map<String, double> mapCount = {};
  Map<String, double> mapPrice = {};
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleText = TextEditingController();
  TextEditingController bodyText = TextEditingController();
  TextEditingController pointCountText = TextEditingController();

  Future<void> selectOptionList(String val, BuildContext context) async {
    switch (val) {
      case "1":
        await editUserState(1);
        break;
      case "2":
        await editUserState(userModel!.usersApprove == 2 ? 1 : 2);
        break;
      case "3":
        showModalSheet(
            context,
            SendNotificationContainer(
              isForPoint: false,
              onTap: () async {
                await sendUserNotifications();
                Get.back();
              },
            ));
        break;
      case "4":
        showModalSheet(
            context,
            SendNotificationContainer(
              isForPoint: true,
              onTap: () async {
                await sendUserPoints();
                Get.back();
              },
            ));
        break;
    }

    update();
  }

  String getUserState() {
    String state = "";
    switch (userModel!.usersApprove) {
      case 0:
        state = "غير مفعل";
        break;
      case 1:
        state = "مفعل";
        break;
      case 2:
        state = "الحساب محظور";
        break;
    }
    return state;
  }

  Future<void> editUserState(int userState) async {
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

  Future<void> getUserPoint() async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = await usersData.getUserPoint(userModel!.usersId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          pointCount = response["data"]["user_point_count"];
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

  Future<void> sendUserNotifications() async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = await usersData.sendUserNotification(
          userId: userModel!.usersId!,
          body: bodyText.text,
          title: titleText.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم الإرسال بنجاح", notifyType: NotifyType.success);
          bodyText.clear();
          titleText.clear();
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

  Future<void> sendUserPoints() async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var response = await usersData.sendUserPoint(
        userId: userModel!.usersId!,
        body: bodyText.text,
        title: titleText.text,
        pointCount: pointCountText.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم الإرسال بنجاح", notifyType: NotifyType.success);
          getUserPoint();
          bodyText.clear();
          titleText.clear();
          pointCountText.clear();
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
    mapCount = {
      "التوصيل": userModel!.deliveryOrdersCount!.toDouble(),
      "الاستلام": userModel!.pickupOrdersCount!.toDouble(),
    };
    mapPrice = {
      "التوصيل": userModel!.deliveryOrdersPrice!.toDouble(),
      "الاستلام": userModel!.pickupOrdersPrice!.toDouble(),
    };

    optionMenu.addAll([
      PopMenuModel(
          name: userModel!.usersApprove == 2
              ? "إلغاء حظر المستخدم"
              : "حظر المستخدم",
          value: "2",
          icon: Icons.no_accounts_outlined),
      PopMenuModel(
          name: "إرسال إشعار",
          value: "3",
          icon: Icons.notification_add_outlined),
      PopMenuModel(
          name: "إرسال نقاط كهدية", value: "4", icon: Icons.redeem_rounded),
    ]);
    if (userModel!.usersApprove == 0) {
      optionMenu.add(PopMenuModel(
          name: "تفعيل", value: "1", icon: Icons.verified_user_rounded));
    }

    getUserPoint();
    super.onInit();
  }

  @override
  void dispose() {
    pointCountText.dispose();
    titleText.dispose();
    bodyText.dispose();
    super.dispose();
  }
}
