import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class AppDrawerController extends GetxController {
  goToHome() {
    Get.offAllNamed(AppRoutes.home);
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

  goToCoupons() {
    Get.offNamed(AppRoutes.viewCoupon);
  }

  goToOffersImage() {
    Get.offNamed(AppRoutes.viewOffersImage);
  }

  goToUsers() {
    Get.offNamed(AppRoutes.usersView);
  }

  goToWeightSize() {
    Get.offNamed(AppRoutes.weightSize);
  }
}
