import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class AppDrawerController extends GetxController {
  goToHome() {
    Get.offNamed(AppRoutes.home);
  }

  goToBranches() {
    Get.offNamed(AppRoutes.branches);
  }

  goToAdminUser() {
    Get.offNamed(AppRoutes.adminUser);
  }

  goToCashUser() {
    Get.offNamed(AppRoutes.cashUser);
  }

  goToCategories() {
    Get.offNamed(AppRoutes.viewCategories);
  }
}
