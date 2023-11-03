import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/image_offer_model/image_offer_model.dart';
import 'view_offers_image_controller.dart';

class EditOffersImageController extends GetxController {
  ImageOfferModel? offerImageModel;

  StatusRequest statusRequest = StatusRequest.none;
  final ViewOffersImageController _viewOffersImageController =
      Get.put(ViewOffersImageController());
  int isActive = 1;
  int viewLevel = 1;
  List viewLevelMap = [
    {"value": 1, "name": "الكل"},
    {"value": 2, "name": "المستخدمين مسجلين الدخول"},
    {"value": 3, "name": "المستخدمين غير مسجلين الدخول"},
  ];

  bool getActiveBool() {
    if (isActive == 1) {
      return true;
    } else {
      return false;
    }
  }

  onChanged(bool? val) {
    val == true ? isActive = 1 : isActive = 0;
    update();
  }

  onSelect(val) {
    viewLevel = val!;

    update();
  }

  editImageData() async {
    try {
      SmartDialog.showLoading(msg: 'loading'.tr);
      var imageEditModel = ImageOfferModel(
        id: offerImageModel!.id,
        isActive: isActive,
        viewLevel: viewLevel,
      );

      var response = await _viewOffersImageController.offerData
          .editOffersImage(imageOfferModel: imageEditModel);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          SmartDialog.dismiss();
          SmartDialog.showNotify(
              msg: "تم التعديل بنجاح", notifyType: NotifyType.success);
          Get.offAndToNamed(AppRoutes.viewOffersImage);
          _viewOffersImageController.getImages();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.showToast(e.toString());
    }

    update();
  }

  initEditData(ImageOfferModel imageModel) {
    isActive = imageModel.isActive!;
    viewLevel = imageModel.viewLevel!;
  }

  @override
  void onInit() {
    offerImageModel = Get.arguments['model'];
    initEditData(offerImageModel!);
    super.onInit();
  }
}
