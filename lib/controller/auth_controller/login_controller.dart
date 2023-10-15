import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/source/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isVisiblePassword = true;

  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  showPassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  @override
  login() async {
    try {
      var formCurrent = formState.currentState;
      if (formCurrent!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await loginData.postData(
          email.text.trim(),
          password.text.trim(),
        );
        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            await saveDataToShared(
              userId: response['data']['cash_system_id'],
              userName: response['data']['cash_user_name'],
              userEmail: response['data']['cash_user_email'],
              userBranch: response['data']['cash_branch_id'],
            );

            myServices.sharedPref.setString('step', "2");

            FirebaseMessaging.instance.subscribeToTopic('branches');
            FirebaseMessaging.instance.subscribeToTopic(
                "branch${response['data']['cash_branch_id']}");
            Get.offAllNamed(AppRoutes.home);
          } else {
            Get.defaultDialog(
                title: 'attention'.tr,
                middleText: "emailOrPasswordError".tr,
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('ok'.tr)),
                ]);
            statusRequest = StatusRequest.failed;
          }
        }
        update();
      } else {}
    } catch (e) {
      SmartDialog.showToast(e.toString());
      print(e.toString());
    }
  }

  saveDataToShared({
    required int userId,
    required String userName,
    required String userEmail,
    required int userBranch,
  }) {
    myServices.sharedPref.setInt('userId', userId);
    myServices.sharedPref.setString('userName', userName);
    myServices.sharedPref.setString('userEmail', userEmail);
    myServices.sharedPref.setInt('branchId', userBranch);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      // ignore: avoid_print
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
