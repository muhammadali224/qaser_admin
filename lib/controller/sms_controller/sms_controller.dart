import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/sms_model/sms_model.dart';
import '../../data/source/remote/sms_data/sms_data.dart';

class SMSController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  SMSData smsData = SMSData(Get.find());
  List<SmsModel> smsList = [];
  String balance = "0.0";

  getBalance() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await smsData.getBalance();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        balance = response["balance"];
        print(balance);
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  getAllSMS() async {
    try {
      SmartDialog.showLoading();
      var response = await smsData.getAllSMS();

      List resp = response;

      smsList.addAll(resp.map((e) => SmsModel.fromJson(e)));
    } catch (e) {
      throw Exception(e.toString());
    }
    SmartDialog.dismiss();
    update();
  }

  @override
  void onInit() async {
    await getBalance();

    super.onInit();
  }
}
