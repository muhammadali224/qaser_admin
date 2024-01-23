import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/enum/status_request.dart';
import '../branches_controller/branch_add_controller.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completerController;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;
  AddBranchesController addBranchesController =
      Get.find<AddBranchesController>();

  getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 17,
      );
      addMarkers(LatLng(position!.latitude, position!.longitude));
      statusRequest = StatusRequest.none;
      lat = position!.latitude;
      long = position!.longitude;
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  confirmLocation() {
    addBranchesController.latitude = lat;
    addBranchesController.longitude = long;

    Get.back();
    addBranchesController.update();
  }

  @override
  void onInit() {
    try {
      completerController = Completer<GoogleMapController>();
      getCurrentLocation();
    } catch (e) {
      throw Exception(e.toString());
    }
    super.onInit();
  }
}
