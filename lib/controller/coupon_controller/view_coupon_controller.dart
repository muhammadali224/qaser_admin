import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/coupon_model/coupon_model.dart';
import '../../data/source/remote/coupon_data/coupon_data.dart';

class CouponViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  List<CouponModel> couponList = [];
  final CouponData couponData = CouponData(Get.find());

  getCoupon() async {
    try {
      couponList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await couponData.getCoupon();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          couponList.addAll(responseList.map((e) => CouponModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  deleteCoupon(int id) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await couponData.deleteCoupon(id.toString());
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          SmartDialog.showToast("تم الحذف بنجاح");
          getCoupon();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  goToAddCoupon() {
    Get.toNamed(AppRoutes.addCoupon);
  }

  goToEditCoupon(CouponModel couponModel) {
    Get.toNamed(AppRoutes.editCoupon, arguments: {
      "model": couponModel,
    });
  }

  @override
  void onInit() async {
    await getCoupon();
    super.onInit();
  }
}
