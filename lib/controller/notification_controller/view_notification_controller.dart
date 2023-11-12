import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/notification_model/notification_model.dart';
import '../../data/source/remote/notification_data/notification_data.dart';

class NotificationViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  List<NotificationModel> notificationList = [];
  final NotificationData notificationData = NotificationData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController body;
  int selectedTopic = 1;
  List topicOption = [
    {"name": "الكل", "value": 1},
    {"name": "الغير مسجلين الدخول", "value": 2},
    {"name": "المسجلين الدخول", "value": 3},
  ];

  void onChanged(int? val) {
    selectedTopic = val!;
    update();
  }

  Future<void> getNotification() async {
    try {
      notificationList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await notificationData.getNotifications();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          notificationList
              .addAll(responseList.map((e) => NotificationModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  Future<void> deleteNotification(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.deleteNotification(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getNotification();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  Future<void> addNotification() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var notificationModel = NotificationModel(
            notificationsTitle: title.text,
            notificationsBody: body.text,
            notificationLevel: selectedTopic);
        var response =
            await notificationData.addNotification(notificationModel);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الارسال بنجاح", notifyType: NotifyType.success);
            title.clear();
            body.clear();
            selectedTopic = 1;
            getNotification();
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

  void goToAddNotification() {
    Get.toNamed(AppRoutes.viewNotification);
  }

  void initData() {
    title = TextEditingController();
    body = TextEditingController();
  }

  @override
  void onInit() async {
    initData();
    await userManagement.getUser();
    adminData = userManagement.user;
    await getNotification();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }
}
