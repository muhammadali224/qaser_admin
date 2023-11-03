import 'dart:io';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/image_offer_model/image_offer_model.dart';
import '../../data/source/remote/offers_image_data/offers_image_data.dart';

class ViewOffersImageController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ImageOfferModel> imagesList = [];
  final OffersImageData offerData = OffersImageData(Get.find());
  File? file;

  Future<void> getImages() async {
    imagesList.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await offerData.getOffersImage();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          imagesList
              .addAll(responseList.map((e) => ImageOfferModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.showToast(e.toString());
    }

    update();
  }

  deleteItems(int id, String imageName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offerData.deleteOffersImage(id.toString(), imageName);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getImages();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  addOfferWithImage() async {
    if (file != null) {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var offerModel = const ImageOfferModel(
        isActive: 1,
        viewLevel: 1,
      );
      var response = await offerData.addOffersImage(
        offerModel,
        file!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم الاضافة بنجاح", notifyType: NotifyType.success);
          getImages();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } else {
      SmartDialog.showToast("الرجاء التأكد من اختيار الصورة");
    }
    update();
  }

  goToEditItem(ImageOfferModel imageOfferModel) {
    Get.toNamed(AppRoutes.editOffersImage, arguments: {
      'model': imageOfferModel,
    });
  }

  goToAddImages() {
    Get.toNamed(AppRoutes.addOffersImage);
  }

  @override
  void onInit() async {
    await getImages();

    super.onInit();
  }
}
