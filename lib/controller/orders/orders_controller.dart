import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/branches_model.dart';
import '../../data/model/orders_model.dart';
import '../../data/source/remote/branch_data.dart';
import '../../data/source/remote/orders_data.dart';

class OrdersController extends GetxController {
  List orderTabs = [
    {'title': 'all', 'icon': Icons.all_inbox},
    {'title': 'pending', 'icon': Icons.pending_actions_outlined},
    {'title': 'onTheRoad', 'icon': Icons.delivery_dining_outlined},
    {'title': 'completed', 'icon': Icons.done_rounded},
    {'title': 'canceled', 'icon': Icons.cancel_outlined},
  ];
  Map orderStatus = {
    0: 'pending',
    1: 'approved',
    2: 'onTheRoad',
    3: 'completed',
    4: 'canceled',
    5: 'rejected',
  };

  Map orderType = {
    0: 'pickup',
    1: 'delivery',
  };

  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> dataAll = [];
  List<OrdersModel> dataPending = [];
  List<OrdersModel> dataOnTheRoad = [];
  List<OrdersModel> dataCompleted = [];
  List<OrdersModel> dataCanceled = [];
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  String? qrResult;

  late String email;
  late String userName;
  late int branchId;
  bool? isOpen;
  BranchModel branchModelData = BranchModel();
  BranchData branchData = BranchData(Get.find());

  getOrders() async {
    if (statusRequest != StatusRequest.close) {
      dataAll.clear();
      dataCanceled.clear();
      dataCompleted.clear();
      dataOnTheRoad.clear();
      dataPending.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await ordersData.getData(myServices.sharedPref.getInt('branchId')!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          dataAll.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
          dataPending.addAll(responseData
              .map((e) => OrdersModel.fromJson(e))
              .where((element) => element.ordersState == 0));
          dataOnTheRoad.addAll(responseData
              .map((e) => OrdersModel.fromJson(e))
              .where((element) => element.ordersState == 2));
          dataCompleted.addAll(responseData
              .map((e) => OrdersModel.fromJson(e))
              .where((element) => element.ordersState == 3));
          dataCanceled.addAll(responseData
              .map((e) => OrdersModel.fromJson(e))
              .where((element) =>
                  element.ordersState == 4 || element.ordersState == 5));
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    }
  }

  changeBranchState(int state) {
    if (state == 0) {
      statusRequest = StatusRequest.close;
    } else {
      statusRequest = StatusRequest.success;
    }
    update();
  }

  getIsOpenBoolean() {
    if (branchModelData.branchIsOpen == 0) {
      return isOpen = false;
    } else if (branchModelData.branchIsOpen == 1) {
      return isOpen = true;
    }
  }

  onChanged(bool val) async {
    isOpen = val;
    updateBranch(val == true ? 1 : 0);
    update();
  }

  updateBranch(int state) async {
    statusRequest = StatusRequest.loading;
    var response = await branchData.changeBranchState(branchId, state);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        changeBranchState(state);
        update();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getBranch() async {
    statusRequest = StatusRequest.loading;
    var response = await branchData.getBranchData(branchId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        branchModelData = BranchModel.fromJson(response['data']);
        isOpen = getIsOpenBoolean();
        if (isOpen == true) {
          changeBranchState(1);
          getOrders();
        } else if (isOpen == false) {
          changeBranchState(0);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToPrinters() {
    Get.toNamed(AppRoutes.printers);
  }

  changeOrderState(int orderState, OrdersModel orModel) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersState(
      orModel.ordersId!,
      orModel.ordersUserid!,
      orderState,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666",
      "إلغاء",
      true,
      ScanMode.QR,
    );

    qrResult = barcodeScanRes;
    Get.forceAppUpdate();

    update();
  }

  @override
  void onInit() async {
    await Jiffy.setLocale('ar_sa');
    email = myServices.sharedPref.getString("userEmail")!;
    userName = myServices.sharedPref.getString("userName")!;
    branchId = myServices.sharedPref.getInt("branchId")!;

    getBranch();

    super.onInit();
  }
}
