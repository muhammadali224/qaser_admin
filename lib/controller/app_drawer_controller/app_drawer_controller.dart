import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class AppDrawerController extends GetxController {
  goToHome() {
    Get.toNamed(AppRoutes.home);
  }

  goToBranches() {
    Get.toNamed(AppRoutes.branches);
  }

  goToAdminUser() {
    Get.toNamed(AppRoutes.adminUser);
  }

  goToCashUser() {
    Get.toNamed(AppRoutes.cashUser);
  }
}
