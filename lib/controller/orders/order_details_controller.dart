import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/orders_model.dart';
import '../../data/source/remote/orders_data.dart';
import '../printers_controller/printers_controller.dart';
import 'orders_controller.dart';

class OrderDetailsController extends GetxController {
  Completer<GoogleMapController>? completerController;
  OrdersController ordersController = Get.find();
  final PrintersController _printersController = Get.put(PrintersController());
  late OrdersModel ordersModel;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  Map orderType = {
    '0': 'pickup',
    '1': 'delivery',
  };

  StatusRequest statusRequest = StatusRequest.none;
  List<OrderDetailsModel> data = [];
  OrdersData ordersData = OrdersData(Get.find());
  late String phoneNumber;

  initData() {
    completerController = Completer<GoogleMapController>();
    if (ordersModel.ordersType == 1) {
      kGooglePlex = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 17,
      );
      markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(
          ordersModel.addressLat!,
          ordersModel.addressLong!,
        ),
      ));
    }
  }

  orderDelete() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersDelete(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
        ordersController.getOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  orderCancel() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersCancel(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
        ordersController.getOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getOrderDetails() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersDetails(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrderDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  printOrders() {
    _printersController.printReceive(ordersModel, data, phoneNumber);
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    phoneNumber = Get.arguments['phoneNumber'];
    getOrderDetails();
    initData();
    super.onInit();
  }
}
