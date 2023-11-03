import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/extension/date_extension.dart';
import '../../core/extension/string_extension.dart';
import '../../core/function/get_branch_name.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/coupon_model/coupon_model.dart';
import 'view_coupon_controller.dart';

class AddEditCouponController extends GetxController {
  bool isEdit = false;
  CouponModel? couponModel;
  StatusRequest statusRequest = StatusRequest.none;
  final CouponViewController _couponViewController =
      Get.put(CouponViewController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController count;
  late TextEditingController discountValue;
  late TextEditingController startDate;
  late TextEditingController endDate;

  int selectedBranch = 1;

  late String dropDownValue;

  void setIsEdit(bool value) {
    isEdit = value;
  }

  onDropChanged(String? val) {
    selectedBranch = int.parse(val!);
    dropDownValue = getBranchName(selectedBranch)!;
    update();
  }

  addCoupon() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var couponModel = CouponModel(
            couponCount: int.parse(count.text),
            couponDiscount: num.parse(discountValue.text),
            couponName: name.text,
            couponExpireDate: endDate.text.parseStringToDateTime(),
            couponStartDate: startDate.text.parseStringToDateTime(),
            branchId: selectedBranch);
        var response =
            await _couponViewController.couponData.addCoupon(couponModel);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.viewCoupon);
            _couponViewController.getCoupon();
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

  editCoupon() async {
    if (formKey.currentState!.validate()) {
      try {
        SmartDialog.showLoading(msg: 'loading'.tr);
        var couponEditModel = CouponModel(
            couponId: couponModel!.couponId,
            couponCount: int.parse(count.text),
            couponDiscount: num.parse(discountValue.text),
            couponName: name.text,
            couponExpireDate: endDate.text.parseStringToDateTime(),
            couponStartDate: startDate.text.parseStringToDateTime(),
            branchId: selectedBranch);
        var response =
            await _couponViewController.couponData.editCoupon(couponEditModel);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            SmartDialog.dismiss();
            SmartDialog.showNotify(
                msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
            Get.offAndToNamed(AppRoutes.viewCoupon);
            _couponViewController.getCoupon();
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
    name = TextEditingController();
    discountValue = TextEditingController();
    count = TextEditingController();
    startDate = TextEditingController(text: DateTime.now().parseDate());
    endDate = TextEditingController(
        text: DateTime.now().add(const Duration(days: 30)).parseDate());
    dropDownValue = getBranchName(1)!;
  }

  initEditData(CouponModel couponModel) {
    name = TextEditingController(text: couponModel.couponName);
    startDate =
        TextEditingController(text: couponModel.couponStartDate!.parseDate());
    endDate =
        TextEditingController(text: couponModel.couponExpireDate!.parseDate());
    discountValue =
        TextEditingController(text: couponModel.couponDiscount.toString());

    count = TextEditingController(text: couponModel.couponCount.toString());
    selectedBranch = couponModel.branchId!;

    dropDownValue = getBranchName(selectedBranch)!;
  }

  @override
  void onInit() {
    if (Get.currentRoute == "/editCoupon") {
      couponModel = Get.arguments['model'];
      setIsEdit(true);
      initEditData(couponModel!);
    } else if (Get.currentRoute == "/addCoupon") {
      initData();
    }
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    count.dispose();
    discountValue.dispose();
    super.dispose();
  }
}
