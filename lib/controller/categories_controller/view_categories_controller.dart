import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/source/remote/categories_data/categories_data.dart';

class ViewCategoriesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<CategoriesModel> categoriesList = [];
  final CategoriesData categoriesData = CategoriesData(Get.find());

  getCategories() async {
    try {
      categoriesList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoriesData.getCategories();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          categoriesList
              .addAll(responseList.map((e) => CategoriesModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  deleteCategory(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.deleteCategory(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        SmartDialog.showToast("تم الحذف بنجاح");
        getCategories();
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  goToViewItems(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.viewItems, arguments: {
      'model': categoriesModel,
    });
  }

  goToEditCategory(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.editCategory, arguments: {
      'model': categoriesModel,
    });
  }

  goToAddCategory() {
    Get.toNamed(AppRoutes.addCategory);
  }

  @override
  void onInit() async {
    await getCategories();
    super.onInit();
  }
}
