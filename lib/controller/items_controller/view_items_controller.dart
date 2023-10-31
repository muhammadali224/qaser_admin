import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/source/remote/items_data/items_data.dart';

class ViewItemController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> itemsList = [];
  late CategoriesModel categoriesModel;
  final ItemsData itemsData = ItemsData(Get.find());

  getItems() async {
    itemsList.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await itemsData.getItems(categoriesModel.categoriesId.toString());
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          itemsList.addAll(responseList.map((e) => ItemsModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      SmartDialog.showToast(e.toString());
    }

    update();
  }

  deleteItems(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.deleteCategory(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getItems();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToEditItem(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.editItems, arguments: {
      'model': itemsModel,
      'catModel': categoriesModel,
    });
  }

  goToAddItems() {
    Get.toNamed(AppRoutes.addItems, arguments: {
      'catModel': categoriesModel,
    });
  }

  @override
  void onInit() async {
    categoriesModel = Get.arguments['model'];
    await getItems();
    super.onInit();
  }
}
