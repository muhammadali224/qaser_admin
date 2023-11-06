import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class AppDrawerController extends GetxController {
  goToHome() {
    Get.offAllNamed(AppRoutes.home);
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

  goToCategories() {
    Get.toNamed(AppRoutes.viewCategories);
  }

  goToCoupons() {
    Get.toNamed(AppRoutes.viewCoupon);
  }

  goToOffersImage() {
    Get.toNamed(AppRoutes.viewOffersImage);
  }

  goToUsers() {
    Get.toNamed(AppRoutes.usersView);
  }

  goToWeightSize() {
    Get.toNamed(AppRoutes.weightSize);
  }
}
