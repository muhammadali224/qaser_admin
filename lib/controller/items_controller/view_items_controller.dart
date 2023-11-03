import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/weight_size_model/weight_size_model.dart';
import '../../data/source/remote/items_data/items_data.dart';
import '../../data/source/remote/weight_size_data/weight_size_data.dart';
import '../../data/source/shared/sub_item_weight_list.dart';

class ViewItemController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> itemsList = [];

  late CategoriesModel categoriesModel;
  final ItemsData itemsData = ItemsData(Get.find());
  final SubItemsData subItemsData = SubItemsData(Get.find());

  Future<void> getItems() async {
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

  Future<void> getSubItems() async {
    subItemsList.clear();
    try {
      var response = await subItemsData.getSubItems();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          subItemsList
              .addAll(responseList.map((e) => WeightSizeModel.fromJson(e)));
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
    var response = await itemsData.deleteItem(id.toString(), imageName);
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

  goToItemDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      'model': itemsModel,
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
    await Future.wait([
      getItems(),
      getSubItems(),
    ]);

    super.onInit();
  }
}
