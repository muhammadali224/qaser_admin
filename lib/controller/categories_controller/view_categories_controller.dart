import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/categories_model/categories_model.dart';
import '../../data/source/remote/categories_data/categories_data.dart';

class ViewCategoriesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  List<CategoriesModel> categoriesList = [];
  final CategoriesData categoriesData = CategoriesData(Get.find());

  getCategories() async {
    try {
      categoriesList.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoriesData.getCategories(
          adminData.adminSuperAdmin.toString(),
          adminData.adminBranchId.toString());
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

  goToViewItems(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.viewItems, arguments: {
      'categoriesModel': categoriesModel,
    });
  }

  @override
  void onInit() async {
    await userManagement.getUser();
    adminData = userManagement.user;
    await getCategories();
    super.onInit();
  }
}
