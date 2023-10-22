import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class BranchesHomeController extends GetxController {
  goToView() {
    Get.toNamed(AppRoutes.viewBranches);
  }

  goToAddBranch() {
    Get.toNamed(AppRoutes.addBranch);
  }
}
