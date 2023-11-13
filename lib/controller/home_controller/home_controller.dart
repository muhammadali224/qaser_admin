import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../core/enum/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/admin_model/admin_model.dart';
import '../../data/model/branch_model/branch_model.dart';
import '../../data/model/total_model/total_model.dart';
import '../../data/source/remote/branches_data/branches_data.dart';
import '../../data/source/remote/home_data/home_data.dart';
import '../../data/source/shared/branch_list.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late AdminModel adminData;
  List<TotalModel> totalSummary = [];
  final BranchesData branchesData = BranchesData(Get.find());
  final HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getBranches() async {
    branchList.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await branchesData.getBranches(
        adminData.adminSuperAdmin.toString(),
        adminData.adminBranchId.toString(),
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          branchList.addAll(responseList.map((e) => BranchModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  Future<void> getSummery([DateTime? date]) async {
    totalSummary.clear();
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.getSummary(date);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List responseList = response['data'];
          totalSummary.addAll(responseList.map((e) => TotalModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      // SmartDialog.showToast(e.toString());
    }
    update();
  }

  @override
  void onInit() async {
    // myServices.sharedPref.clear(); //
    await userManagement.getUser();
    adminData = userManagement.user;
    Future.wait([getBranches(), getSummery()]);
    initializeDateFormatting();
    super.onInit();
  }
}
